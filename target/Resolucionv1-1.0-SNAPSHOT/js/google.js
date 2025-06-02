// Esperar a que el DOM cargue completamente
window.onload = function () {
    google.accounts.id.initialize({
        client_id: "590243711125-actq5pookk45bqi6lrin3cgmigrspjtn.apps.googleusercontent.com",
        callback: handleCredentialResponse
    });

    google.accounts.id.renderButton(
        document.getElementById("google-button"),
        {
            theme: "filled_blue", // Alternativas: outline | filled_black | filled_blue
            size: "large",
            shape: "pill",         // Otros: rectangular, circle, square
            width: 250
        }
    );
};

// Callback cuando Google responde con el ID Token
function handleCredentialResponse(response) {
    const id_token = response.credential;

    // Enviar el ID token a tu servlet
    fetch("logingoogle", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({ id_token })
    })
    .then(res => res.json())
    .then(data => {
        if (data.resultado === "ok") {
            // Guardar el token en una cookie (opcional)
            Cookies.set('token', data.token, { expires: 1 });

            // También puedes guardarlo en sessionStorage o localStorage
            // sessionStorage.setItem('token', data.token);

            alert("Bienvenido " + data.email);
            window.location.href = "principal.html"; // Cambia por la ruta real
        } else {
            alert("Error: " + data.mensaje);
        }
    })
    .catch(err => {
        console.error("Error al iniciar sesión con Google", err);
        alert("Ocurrió un error al iniciar sesión con Google");
    });
}
