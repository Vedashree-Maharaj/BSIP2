function getWeather() {
    let city = document.getElementById("city").value.trim();
    let apiKey = "594f1dde903365ef941fc0a2e0359cbd";
    let url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

    fetch(url)
        .then(res => res.json())
        .then(data => {
            if (data.cod == 200) {
                document.getElementById("weather").style.display = "block"; 
                document.getElementById("weather").innerHTML = `
                    <h2>🌍 Weather in ${data.name}, ${data.sys.country}</h2>
                    <p><b>🌡️ Temperature:</b> ${data.main.temp}°C</p>
                    <p><b>🥶 Feels Like:</b> ${data.main.feels_like}°C</p>
                    <p><b>💦 Humidity:</b> ${data.main.humidity}%</p>
                    <p><b>⛅ Condition:</b> ${data.weather[0].description}</p>
                    <p><b>💨 Wind Speed:</b> ${data.wind.speed} m/s</p>
                    
                    <img src="https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png" alt="Weather Icon">
                `;
            } else {
                document.getElementById("weather").style.display = "block";
                document.getElementById("weather").innerHTML = "❌ City not found! Try again.";
            }
        })
        
}
