<cfscript>
    function celsiusToFahrenheit(celsius){
        return celsius * (9/5) + 32
    }
    
    function fahrenheitToCelsius(farenheit){
        return (farenheit - 32) * (5/9)
    }

    if (structKeyExists(form, "temperature") && structKeyExists(form, "conversionType") && isNumeric(form.temperature)) {
        inputTemp = form.temperature
        if (form.conversionType == "CtoF") {
            convertedTemp = celsiusToFahrenheit(inputTemp);
            message = "#inputTemp# Celsius is equivalent to #convertedTemp# Fahrenheit";
        } else if (form.conversionType == "FtoC") {
            convertedTemp = fahrenheitToCelsius(inputTemp);
            message = "#inputTemp# Fahrenheit is equivalent to #convertedTemp# Celsius";
        }
    }
</cfscript>

<html>

<head>
    <title>Temperature Converter</title>
</head>

<body>

    <form action="temp.cfm" method="post">
        Enter temperature: <input type="text" name="temperature">
        <select name="conversionType">
            <option value="CtoF">Celsius to Fahrenheit</option>
            <option value="FtoC">Fahrenheit to Celsius</option>
        </select>
        <input type="submit" value="Convert">
    </form>

</body>

</html>

<cfoutput>
    <cfif isDefined("message")>
        <p>#message#</p>
    </cfif>
</cfoutput>