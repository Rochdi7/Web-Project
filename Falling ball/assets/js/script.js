const gamecontainer = document.querySelector(".gamecontainer");
const ball = document.querySelector(".ball");
let leftPost;
let interval;
let keyDown = false;

// Move Left
const moveLeft = () => {
    leftPost = parseInt(getComputedStyle(ball).getPropertyValue("left"));
    if (leftPost > 0) {
        ball.style.left = leftPost - 2 + "px";
    }
}

// Move Right
const moveRight = () => {
    leftPost = parseInt(getComputedStyle(ball).getPropertyValue("left"));
    if (leftPost < 485) {
        ball.style.left = leftPost + 2 + "px";
    }
}

// Key Events for Movement
document.addEventListener("keydown", (event) => {
    if (!keyDown) {
        if (event.key === "ArrowLeft") {
            interval = setInterval(moveLeft, 5);
        }
        if (event.key === "ArrowRight") {
            interval = setInterval(moveRight, 5);
        }
    }
    keyDown = true;
});

document.addEventListener("keyup", () => {
    clearInterval(interval);
    keyDown = false;
});

// Generate Obstacles
const generateObstacles = () => {
    let block = document.createElement("div");
    let gap = document.createElement("div");
    block.classList.add("block");
    gap.classList.add("gap");

    let randomGap = Math.floor(Math.random() * 320);
    gap.style.left = randomGap + "px";

    gamecontainer.appendChild(block);
    gamecontainer.appendChild(gap);

    // Remove obstacles once they finish animation
    $(block).on("animationend", function () {
        $(this).remove();
    });

    $(gap).on("animationend", function () {
        $(this).remove();
    });
};

// Generate obstacles every 1.5 seconds
setInterval(generateObstacles, 1500);

// Improved Collision Detection Function
function collision(a, b) {
    let aRect = a.getBoundingClientRect();
    let bRect = b.getBoundingClientRect();

    return !(
        aRect.bottom < bRect.top ||
        aRect.top > bRect.bottom ||
        aRect.right < bRect.left ||
        aRect.left > bRect.right
    );
}

// Check Collisions
const checkCollisions = () => {
    const allBlocks = document.querySelectorAll(".block");
    const allGaps = document.querySelectorAll(".gap");

    let hitObstacle = false;

    allBlocks.forEach(b => {
        if (collision(b, ball)) {
            hitObstacle = true;
        }

        allGaps.forEach(h => {
            if (collision(h, ball)) {
                hitObstacle = false; // Allow the ball to pass through the gap
            }
        });
    });

    if (hitObstacle) {
        alert("Game Over!");
        location.reload();
    }
};

// Check for collisions every 100ms
setInterval(checkCollisions, 100);
