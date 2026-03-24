<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.Period, java.time.format.DateTimeParseException" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Age Calculator</title>
<style>
    /* Centering the form and adding some spacing */
    .card { margin-top: 50px; text-align: center; font-family: sans-serif; }
    .input-container { display: flex; gap: 15px; justify-content: center; align-items: flex-end; }
    .input-group { display: flex; flex-direction: column; text-align: left; }
    input { padding: 5px; width: 80px; }
    button { padding: 6px 15px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; }
    table { margin: 20px auto; border-collapse: collapse; }
    td { padding: 10px; border: 1px solid #ddd; }
</style>
</head>
<body>

<main class="card">
    <section>
      <form id="age-form" method="GET">
        <div class="input-container">
          <div class="input-group">
            <label for="day">Day</label>
            <input type="number" name="day" placeholder="DD" required min="1" max="31">
          </div>
          <div class="input-group">
            <label for="months">Month</label>
            <input type="number" name="months" placeholder="MM" required min="1" max="12">
          </div>
          <div class="input-group">
            <label for="years">Year</label>
            <input type="number" name="years" placeholder="YYYY" required>
          </div>
          <button type="submit">Calculate</button>
        </div>
       </form>
      </section>

    <%
    String dayParam = request.getParameter("day");
    String monthParam = request.getParameter("months");
    String yearParam = request.getParameter("years");
    
    try {
        if (dayParam != null && monthParam != null && yearParam != null) {
            // FIXED: Passing variables instead of "string literals"
            int d = Integer.parseInt(dayParam);
            int m = Integer.parseInt(monthParam);
            int y = Integer.parseInt(yearParam);
            
            LocalDate inputDate = LocalDate.of(y, m, d);
            LocalDate today = LocalDate.now();
            
            Period diff = Period.between(inputDate, today);
            int py = diff.getYears();
            int pm = diff.getMonths();
            int pd = diff.getDays();
    %>
    <table>
        <caption><strong>Your age is:</strong></caption>
        <tr><td>Years</td><td><%= py %></td></tr>
        <tr><td>Months</td><td><%= pm %></td></tr>
        <tr><td>Days</td><td><%= pd %></td></tr>
    </table>
    <%
        }
    } catch (DateTimeParseException e) {
        out.println("<p style='color:red;'><strong>Error:</strong> That date doesn't exist (e.g., Feb 31st).</p>");
    } catch (NumberFormatException e) {
        out.println("<p style='color:red;'><strong>Error:</strong> Please enter valid numbers.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'><strong>Error:</strong> Something went wrong.</p>");
    }
    %>
</main>

</body>
</html>
