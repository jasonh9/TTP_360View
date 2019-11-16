import React from 'react'
import ttp from '../../assets/images/ttp.png'
import './dispatchLogo.css'

const dispatchLogo = () => {
    return(
        <div className='logo'>
            <img src={ttp} />
            <p>Command Center<br/>Dashboard</p>
        </div>
    )
}

export default dispatchLogo;