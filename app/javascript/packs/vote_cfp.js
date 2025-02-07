getVotedIds = function() {
    let votedIds = [];
    document.cookie.split(';').forEach(function(cookie) {
        if (cookie.includes('voted_id=')) {
            votedIds = JSON.parse(cookie.split('=')[1]);
        }
    })
    return votedIds;
}

setVotedId = function(id) {
    let arr = getVotedIds();
    arr.push(id);
    document.cookie = "voted_id=" + JSON.stringify(arr);
}

toggleVoted = function() {
    let btn = document.getElementById('vote');
    btn.disabled = true;
    btn.innerHTML = "投票済み";
}

document.getElementById('vote').addEventListener('click', function() {
    const voteUrl = document.getElementById('vote').getAttribute('vote_url')
    fetch(voteUrl,{ method: 'POST' })
    setVotedId(parseInt(document.getElementById('vote').getAttribute('talk_id')));
    toggleVoted();
    return false;
});

window.addEventListener('DOMContentLoaded', function() {
    if (getVotedIds().includes(parseInt(document.getElementById('vote').getAttribute('talk_id')))) {
        toggleVoted();
    }
})