import React from 'react';
import './index.css';
import {getConnectionStatus, emitToSocket, subToDevices, getAllActiveUsers} from '../../utils/socketAPI';
import store from '../../redux/store/index';

class UserButton extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            activeUsers : null
        }
    }
    componentDidMount(){
        store.subscribe(() => {
            this.stateUpdater(store.getState().user_state.uuid)
            // console.log(this.state.activeUsers)
        })

        subToDevices('297b42a9-9e31-43db-b436-f7b61a55688a')
        getAllActiveUsers()
    }

    componentDidUpdate(){
        // console.log(this.state.activeUsers)
    }

    stateUpdater(val) {
        this.setState( () => {
            return { activeUsers : val }
        })
    }


    render(){
        const handleClick = (val) =>{
            console.log(`subbing to ${val}`)
            subToDevices(val)
        }
        const buttonList = (state = this.state.activeUsers) => {
            for(const value in state){
                // console.log(state[value])
                // return(
                //     <button>{state[value]}</button>
                // )
                // return button(state[value])
                const listItems = state.map((item) => <li onClick={()=> handleClick(item)}>{item}</li>)
                return listItems
            }
        }
        return(
            <div className="activeUsers">
                <ul>
                    {buttonList()}
                </ul>
            </div>
        )
    }
}

export default UserButton;