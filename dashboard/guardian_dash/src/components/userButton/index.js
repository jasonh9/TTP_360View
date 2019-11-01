import React from 'react';
import './index.css';

class UserButton extends React.Component {
    render(){
        return(
            <div className="activeUsers">
                <ul>
                    <li>
                        user1
                    </li>
                    <li>
                        user2
                    </li>
                    <li>
                        user3
                    </li>
                </ul>
            </div>
        )
    }
}

export default UserButton;