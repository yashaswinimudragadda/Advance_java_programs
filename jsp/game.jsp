<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
// 1. Initialization
String[] board = (String[]) session.getAttribute("board");
String turn = (String) session.getAttribute("turn");
String winner = (String) session.getAttribute("winner");
Integer scoreX = (Integer) session.getAttribute("scoreX");
Integer scoreO = (Integer) session.getAttribute("scoreO");
int[] winIndices = (int[]) session.getAttribute("winIndices");

// Reset Logic
if (board == null || request.getParameter("reset") != null || request.getParameter("fullReset") != null) {
    board = new String[]{"1", "2", "3", "4", "5", "6", "7", "8", "9"};
    turn = "X";
    winner = null;
    winIndices = null;
    session.setAttribute("board", board);
    session.setAttribute("turn", turn);
    session.setAttribute("winner", winner);
    session.setAttribute("winIndices", null);
    
    if (request.getParameter("fullReset") != null) {
        scoreX = 0; scoreO = 0;
        session.setAttribute("scoreX", 0);
        session.setAttribute("scoreO", 0);
        session.setAttribute("seriesWinner", null);
    }
}

if (scoreX == null) scoreX = 0;
if (scoreO == null) scoreO = 0;
 
// 2. Game Logic
String moveStr = request.getParameter("move");
if (moveStr != null && winner == null) {
    int index = Integer.parseInt(moveStr) - 1;
    if (!board[index].equals("X") && !board[index].equals("O")) {
        board[index] = turn;
        String tempWinner = null;
        
        for (int a = 0; a < 8; a++) {
            String line = "";
            int[] checkIndices = new int[3];
            switch (a) {
                case 0: line = board[0] + board[1] + board[2]; checkIndices = new int[]{0, 1, 2}; break;
                case 1: line = board[3] + board[4] + board[5]; checkIndices = new int[]{3, 4, 5}; break;
                case 2: line = board[6] + board[7] + board[8]; checkIndices = new int[]{6, 7, 8}; break;
                case 3: line = board[0] + board[3] + board[6]; checkIndices = new int[]{0, 3, 6}; break;
                case 4: line = board[1] + board[4] + board[7]; checkIndices = new int[]{1, 4, 7}; break;
                case 5: line = board[2] + board[5] + board[8]; checkIndices = new int[]{2, 5, 8}; break;
                case 6: line = board[0] + board[4] + board[8]; checkIndices = new int[]{0, 4, 8}; break;
                case 7: line = board[2] + board[4] + board[6]; checkIndices = new int[]{2, 4, 6}; break;
            }
            
            if (line.equals("XXX") || line.equals("OOO")) {
                tempWinner = turn;
                winIndices = checkIndices;
                break;
            }
        }
        
        if (tempWinner == null) {
            boolean isFull = true;
            for (String s : board) { if (!s.equals("X") && !s.equals("O")) { isFull = false; break; } }
            if (isFull) tempWinner = "draw";
        }
        
        if (tempWinner != null) {
            winner = tempWinner;
            if (winner.equals("X")) scoreX++;
            if (winner.equals("O")) scoreO++;
            session.setAttribute("scoreX", scoreX);
            session.setAttribute("scoreO", scoreO);
            session.setAttribute("winIndices", winIndices);
            
            // Fixed logic here: check scoreO for O
            if (scoreX >= 2 || scoreO >= 2) session.setAttribute("seriesWinner", scoreX >= 2 ? "X" : "O");
        } else {
            turn = turn.equals("X") ? "O" : "X";
        }
        
        session.setAttribute("board", board);
        session.setAttribute("turn", turn);
        session.setAttribute("winner", winner);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Tic Tac Toe</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; text-align: center; background: #f0f2f5; padding-top: 50px; }
        .game-card { background: white; padding: 30px; border-radius: 15px; display: inline-block; box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .grid { display: grid; grid-template-columns: repeat(3, 100px); gap: 12px; margin: 20px 0; }
        .cell {
            width: 100px; height: 100px; background: #fff; border: 2px solid #eee; border-radius: 10px;
            display: flex; align-items: center; justify-content: center; font-size: 2.5rem; font-weight: bold;
            text-decoration: none; transition: all 0.2s;
        }
        /* Fixed selector: .cell.empty:hover */
        .cell.empty:hover { background: #f8f9fa; transform: scale(1.05); }
        .X { color: #ff4757; }
        .O { color: #2f3542; }
        .winner-cell { background-color: #ffd700 !important; color: white !important; border-color: #ffa502 !important; animation: pulse 1s infinite; }
        @keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.05); } 100% { transform: scale(1); } }
        .status { font-size: 1.3rem; margin-bottom: 10px; height: 40px; }
        .btn-reset { display: inline-block; margin: 10px; padding: 12px 25px; background: #2ed573; color: white; text-decoration: none; border-radius: 8px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="game-card">
        <h1>Tic Tac Toe</h1>
        <div class="scoreboard">
            <h3 style="margin: 0;">Series Score</h3>
            <span class="X">X: <%= scoreX %></span> | <span class="O">O: <%= scoreO %></span>
        </div>
        
        <div class="status">
            <% if (session.getAttribute("seriesWinner") != null) { %>
                <b style="color: gold;">🏆 Series Over! Winner: <%= session.getAttribute("seriesWinner") %> 🏆</b>
            <% } else if (winner == null) { %>
                Turn: <span class="<%= turn %>"><%= turn %></span>
            <% } else { %>
                <b><%= winner.equals("draw") ? "It's a Draw!" : "Winner: " + winner %></b>
            <% } %>
        </div>
        
        <div class="grid">
            <%
                for (int i = 0; i < 9; i++) {
                    boolean isOccupied = board[i].equals("X") || board[i].equals("O");
                    boolean isWinningCell = false;
                    if (winIndices != null) {
                        for (int w : winIndices) if (w == i) isWinningCell = true;
                    }
                    if (isOccupied || winner != null) {
            %>
                <%-- Added a space between classes --%>
                <div class="cell <%= isOccupied ? board[i] : "" %> <%= isWinningCell ? "winner-cell" : "" %>">
                    <%= isOccupied ? board[i] : "" %>
                </div>
            <% } else { %>
                <a href="?move=<%= i + 1 %>" class="cell empty"></a> 
            <% } } %>
        </div>
        <a href="?reset=true" class="btn-reset">Next Round</a>
        <a href="?fullReset=true" class="btn-reset" style="background: #ff4757;">Reset Series</a>
    </div>
</body>
</html>
