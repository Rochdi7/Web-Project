const allCards = document.querySelectorAll(".card");

let firstCard = null,
    secondCard = null;
let canClick = true;
let score = 0;

allCards.forEach((card) => {
    card.addEventListener("click", handleCardClicked);
});

function handleCardClicked() {
    if (!canClick || this.classList.contains("flip") || this === firstCard) return;

    this.classList.add("flip");

    if (!firstCard) {
        firstCard = this;
    } else if (!secondCard) {
        secondCard = this;
        canClick = false; 

        let lang1 = firstCard.getAttribute("data-language");
        let lang2 = secondCard.getAttribute("data-language");

        if (lang1 === lang2) {
            console.log(`Matched: ${lang1}!`);
            firstCard.removeEventListener("click", handleCardClicked);
            secondCard.removeEventListener("click", handleCardClicked);
            resetCards();
            score++;

            if (score === 6) handleWin();
        } else {
            setTimeout(() => {
                firstCard.classList.remove("flip");
                secondCard.classList.remove("flip");
                resetCards();
            }, 1000);
        }
    }
}

function resetCards() {
    firstCard = null;
    secondCard = null;
    canClick = true;
}
// if you win ?
function handleWin() {
    setTimeout(() => {
        let valid = confirm("You win! 🎉 Do you want to play again?");
        if (valid) {
            window.location.reload();
        }
    }, 1000);
}

// Shuffle the cards randomly
allCards.forEach((card) => {
    let randomOrder = Math.floor(Math.random() * 12);
    card.style.order = randomOrder;
});
