<cfscript>
    todos = queryExecute(
        "SELECT * FROM todos",
        {},{datasource: "mysql"} 
        );
</cfscript>


<html>
    <head>
        <link href="/HelloWorld/ostyles.css" rel="stylesheet" />
    </head>
    <body class="bg-red-200 text-2xl p-5">
        <form action="addtodo.cfm" method="POST" class="flex gap-5">
            <input name="todo" placeholder="clean my room..."/  class="p-2">
            <button type="submit" class="bg-gray-500 rounded-lg p-2 hover:bg-gray-30">Submit</button>
        </form>
    </body>


    <div class="flex flex-col gap-2">
        <cfif todos.recordCount gt 0>
            <cfoutput query="todos">
                <form action="deletetodo.cfm" method="POST" class="flex gap-5 items-center">
                    <p>#todos.todo#</p>
                    <input type="hidden" name="todoId" value="#todos.id#">
                    <button type="submit" class="bg-gray-500 rounded-lg p-2 hover:bg-gray-300">Delete</button>
                </form>
            </cfoutput>
        <cfelse>
            <p>no todos...</p>
        </cfif>
    </div>

</html>