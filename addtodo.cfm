<cfscript>
    if (structKeyExists(form, "todo")){
        queryExecute(
            "INSERT INTO todos (todo) VALUES (:todo)",
            {todo: form.todo},
            {datasource: "mysql"}
        );
    }
</cfscript>

<cflocation url="todolist.cfm" addtoken="no">