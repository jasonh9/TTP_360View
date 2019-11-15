import React from 'react';
import './index.css';
import jane from '../../assets/images/jane.png'
import joe from '../../assets/images/joe.png'
import john from '../../assets/images/john.png'
import mark from '../../assets/images/mark.png'
import check from '../../assets/images/icons/check-circle-solid.svg'
import bad from '../../assets/images/icons/times-circle-solid.svg'

class UserButton extends React.Component {
    render(){
        return(
            <div className="activeUsers">
                <ul>
                    <li>
                        <img className='status' src={check} />
                        <img className='avatar' src={jane} />
                        <p>Jane Smith</p>
                    </li>
                    <li className='active'>
                        <img className='status' src={bad} />
                        <img className='avatar' src={john} />
                        <p>John Smith</p>
                    </li>
                    <li>
                        <img className='status' src={check} />
                        <img className='avatar' src={joe} />
                        <p>Joe Smith</p>
                    </li>
                    <li>
                        <img className='status' src={check} />
                        <img className='avatar' src={mark} />
                        <p>Mark Twain</p>
                    </li>
                </ul>
            </div>
        )
    }
}

export default UserButton;