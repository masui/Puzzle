function hex2(val){
    return ('0'+val.toString(16)).slice(-2)
}

function random(n){
    return Math.floor(Math.random()*n)
}

function colorstr(r,g,b){
    return `#${hex2(r)}${hex2(g)}${hex2(b)}`
}

let changex = random(5)    // 変化する矩形の位置
let changey = random(5)

let changediv = null       // 色が変化する矩形
for(let x=0;x<5;x++){
    for(let y=0;y<5;y++){
        $('<div>')
	    .css('position','absolute')
	    .css('width','100')
	    .css('height','100')
	    .css('top',y*100)
	    .css('left',x*100)
	    .css('background-color',
		 colorstr(random(256),random(256),random(256)))
	    .attr('id',`rect${x}${y}`)
	    .appendTo($('body'))
    }
}

// 変化前の色
let startr = random(256)
let startg = random(256)
let startb = random(256)
// 変化後の色
let endr, endg, endb

// 変化後の色を決める
// 変化前の色とかなり違う色を選ぶ
while(true){
    endr = random(256)
    endg = random(256)
    endb = random(256)
    if(Math.abs(endr-startr) > 80 &&
       Math.abs(endg-startg) > 80 &&
       Math.abs(endb-startb) > 80){
	break
    }
}

const step = 100
const period1 = 10000
const step2 = 1000
const period2 = 7000

let count = 0
setInterval(function(){
    count += step // 現在時刻

    if(count < period1){ // 徐々に色を変化させる
	let r = Math.floor((startr * (period1-count) + endr * count) / period1)
	let g = Math.floor((startg * (period1-count) + endg * count) / period1)
	let b = Math.floor((startb * (period1-count) + endb * count) / period1)
	$(`#rect${changex}${changey}`).css('background-color',colorstr(r,g,b))
    }
    else { // 最初の色と最後の色を交互に表示
	if(count >= period1 + period2){
	    count = 0
	}
	else {
	    let t = count - period1
	    if((count - period1) % step2 == 0){
		if(t % (step2 * 2) == 0){
		    $(`#rect${changex}${changey}`).css('background-color',colorstr(startr,startg,startb))
		}
		else {
		    $(`#rect${changex}${changey}`).css('background-color',colorstr(endr,endg,endb))
		}
	    }
	}
    }
},step)

/*
setTimeout(function(){
    $(`#rect${changex}${changey}`)
	.css('border','solid')
	.css('border-color','#ddd')
	.css('z-index','100')
},5000);


count = 0;
sec = 5
maxcount = sec * 1000 / 10;

function disp(){
    r = Math.floor((startr * (maxcount-count) + endr * count) / maxcount);
    g = Math.floor((startg * (maxcount-count) + endg * count) / maxcount);
    b = Math.floor((startb * (maxcount-count) + endb * count) / maxcount);
    $(`#rect${changex}${changey}`).css('background-color',colorstr(r,g,b));
    if(count < maxcount){
        count += 1;
      	setTimeout(disp,10);
    }
}

setTimeout(disp,30);
*/

