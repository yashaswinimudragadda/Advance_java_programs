 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
< %@ page import="java.util.*" %>

<%
    // --- 1. INITIALIZATION ---
    String[] board = (String[]) session.getAttribute("board");
    String turn = (String) session.getAttribute("turn");
    String winner = (String) session.getAttribute("winner");

    // Initialize if first visit or reset requested
    if (board == null || request.getParameter("reset") != null) {
        board = new String[]{"1", "2", "3", "4", "5", "6", "7", "8", "9"};
        turn = "X";
        winner = null;
        session.setAttribute("board", board);
        session.setAttribute("turn", turn);
        session.setAttribute("winner", winner);
    }

    // --- 2. GAME LOGIC ---
    String moveStr = request.getParameter("move");
    if (moveStr != null && winner == null) {
        int index = Integer.parseInt(moveStr) - 1;
        
        // Only process move if the cell is not already taken
        if (!board[index].equals("X") && !board[index].equals("O")) {
            board[index] = turn;
            
            // Check for a winner (Classic Switch for Java 8+ compatibility)
            String tempWinner = null;
            for (int a = 0; a < 8; a++) {
                String line = "";
                switch (a) {
                    case 0: line = board[0] + board[1] + board[2]; break;
                    case 1: line = board[3] + board[4] + board[5]; break;
                    case 2: line = board[6] + board[7] + board[8]; break;
                    case 3: line = board[0] + board[3] + board[6]; break;
                    case 4: line = board[1] + board[4] + board[7]; break;
                    case 5: line = board[2] + board[5] + board[8]; break;
                    case 6: line = board[0] + board[4] + board[8]; break;
                    case 7: line = board[2] + board[4] + board[6]; break;
                }
 
                if (line.equals("XXX")) { tempWinner = "X"; break; }
                else if (line.equals("OOO")) { tempWinner = "O"; break; }
            }

            // Check for Draw if no winner found
            if (tempWinner == null) {
                boolean isFull = true;
                for (String s : board) {
                    if (!s.equals("X") && !s.equals("O")) { isFull = false; break; }
                }
                if (isFull) tempWinner = "draw";
            }

            // Update State
            if (tempWinner != null) {
                winner = tempWinner;
            } else {
                turn = turn.equals("X") ? "O" : "X";
            }
            
            // Save to Session
            session.setAttribute("board", board);
            session.setAttribute("turn", turn);
            session.setAttribute("winner", winner);
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Tic Tac Toe</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align: center; background: #f0f2f5; padding-top: 50px; }
        .game-card { background: white; padding: 30px; border-radius: 15px; display: inline-block; box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .grid { display: grid; grid-template-columns: repeat(3, 100px); grid-template-rows: repeat(3, 100px); gap: 12px; margin: 20px 0; }
        .cell {
            width: 100px; height: 100px; background: #fff; border: 2px solid #eee; border-radius: 10px;
            display: flex; align-items: center; justify-content: center; font-size: 2.5rem; font-weight: bold;
            text-decoration: none; transition: all 0.2s;
        }
        .cell.empty:hover { background: #f8f9fa; border-color: #ddd; transform: scale(1.02); }
        .cell.taken { cursor: not-allowed; }
        .X { color: #ff4757; }
        .O { color: #2f3542; }
        .status { font-size: 1.3rem; font-weight: 500; height: 30px; margin-bottom: 10px; }
        .btn-reset { 
            display: inline-block; margin-top: 20px; padding: 12px 25px; 
            background: #2ed573; color: white; text-decoration: none; 
            border-radius: 8px; font-weight: bold; transition: background 0.3s;
        }
        .btn-reset:hover { background: #26af5d; }
    </style>
</head>
<body>

    <div class="game-card">
        <h1>Tic Tac Toe</h1>

        <div class="status">
            <% if (winner == null) { %>
                Player <span class="<%= turn %>"><%= turn %></span>'s Turn
            <% } else if (winner.equals("draw")) { %>
                <span style="color: #ffa502;">It's a Draw!</span>
            <% } else { %>
                <span style="color: #2ed573;">Player <%= winner %> Wins!</span>
            <% } %>
        </div>

        <div class="grid">
            <% for (int i = 0; i < 9; i++) { 
                boolean isOccupied = board[i].equals("X") || board[i].equals("O");
            %>
                <% if (isOccupied || winner != null) { %>
                    <div class="cell taken <%= isOccupied ? board[i] : "" %>">
                        <%= isOccupied ? board[i] : "" %>
                    </div>
                <% } else { %>
                    <a href="?move=<%= i+1 %>" class="cell empty"></a>
                <% } %>
            <% } %>
        </div>

        <a href="?reset=true" class="btn-reset">New Game</a>
    </div>

</body>
</html>
