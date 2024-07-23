if(loggedInUser === "") {
    Swal.fire({
        title: 'Redirecting...',
        html: 'You will be redirected to the login page in <b></b> milliseconds.',
        timer: 5000,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            const b = Swal.getHtmlContainer().querySelector('b')
            Swal.getTimerLeft()
            timerInterval = setInterval(() => {
                b.textContent = Swal.getTimerLeft()
            }, 100)
        },
        willClose: () => {
            clearInterval(timerInterval)
        }
    }).then((result) => {
        if (result.dismiss === Swal.DismissReason.timer) {
            console.log('I was closed by the timer')
            window.location.href = `${pageContext}/login`;
        }
    })
}