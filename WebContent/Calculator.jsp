<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" 
              content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%!
            enum Action {
                ADD, SUB, MUL, DIV
            };
            HashMap<String, Action> hm = 
                    new HashMap<String, Action>();

            double add(double v1, double v2) {
                return v1 + v2;
            }

            double sub(double v1, double v2) {
                return v1 - v2;
            }

            double div(double v1, double v2) {
                return v1 / v2;
            }

            double mul(double v1, double v2) {
                return v1 * v2;
            }

        %>

        <%
            Action e = Action.ADD;
            hm.put("add", Action.ADD);
            hm.put("sub", Action.SUB);
            hm.put("mul", Action.MUL);
            hm.put("div", Action.DIV);
            String o = request.getParameter("o");
            String n1 = request.getParameter("n1");
            String n2 = request.getParameter("n2");
            double v1 = 5;
            double v2 = 5;
            try {
                if (n1 != null) {
                    v1 = Double.parseDouble(n1);
                }
                if (n2 != null) {
                    v2 = Double.parseDouble(n2);
                }
                if (o != null && hm.get(o) != null) {
                    e = hm.get(o);
                } else {%>
        <h1>Invalid Operation</h1>
        <h1>Default values assumed</h1>
        <%}
            } catch (Exception ex) {
                out.println("<h1>Invalid input "
                        + "default values assumed</h1>");
            }
            double v = 0;
            switch (e) {
                case ADD:
                    v = add(v1, v2);
                    break;
                case SUB:
                    v = sub(v1, v2);
                    break;
                case DIV:
                    v = div(v1, v2);
                    break;
                case MUL:
                    v = mul(v1, v2);
                    break;
            }

            out.println("<h1> Result =  " + v + "</h1>");
        %>

    </body>
</html>