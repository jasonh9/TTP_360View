import React from 'react';

const dispatchCSS = {
    'color' : 'green',
    'border' : '1px solid #000',
    'borderRadius' : '60px',
    'width' : '50%',
    'margin' : '0 auto',
    'padding' : '40px 0 40px 0',
}

const dispatchLogo = () => {
    return(
        <div style={dispatchCSS}>Dispatch Image</div>
    )
}

export default dispatchLogo;