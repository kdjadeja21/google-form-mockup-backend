exports.send = (status, code = 200, message, data = "") => {
    return {
        data: data,
        status: status,
        code: code,
        message: message
    };
}
