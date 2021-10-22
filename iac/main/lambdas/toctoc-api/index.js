const got = require('got');

export.handler = async (event, context) => {
    console.log('Received event', event);
    console.log('Context' , context);

    try {
        const response = await.got ('https://aws.adalo.api/construtor');
        console.log(response.body);
        

        return{
            status: 200,
            body:JSON.parse(response.body),
        };


    

    } catch (error) {
        console.error(error);
        throw new Error(error)

    }
}
