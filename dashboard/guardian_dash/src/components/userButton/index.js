import React from 'react';
import './index.css';
import jane from '../../assets/images/jane.png'
import joe from '../../assets/images/joe.png'
import john from '../../assets/images/john.png'
import mark from '../../assets/images/mark.png'
import check from '../../assets/images/icons/check-circle-solid.svg'
import bad from '../../assets/images/icons/times-circle-solid.svg'

class UserButton extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            activeUsers : null
        }
    }
    componentDidMount(){
        // store.subscribe(() => {
        //     this.stateUpdater(store.getState().user_state.uuid)
        //     // console.log(this.state.activeUsers)
        // })

        // subToDevices('297b42a9-9e31-43db-b436-f7b61a55688a')
        // getAllActiveUsers()
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
        // const handleClick = (val) =>{
        //     console.log(`subbing to ${val}`)
        //     subToDevices(val)
        // }
        // const buttonList = (state = this.state.activeUsers) => {
        //     for(const value in state){
        //         // console.log(state[value])
        //         // return(
        //         //     <button>{state[value]}</button>
        //         // )
        //         // return button(state[value])
        //         const listItems = state.map((item) => <li onClick={()=> handleClick(item)}>{item}</li>)
        //         return listItems
        //     }
        // }
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