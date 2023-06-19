program post_request
    ! This program demonstrates sending JSON data using POST request and printing the
    ! status, length of the body, method, and the body of the response.
    use http, only: response_type, request, HTTP_POST
    implicit none
    type(response_type) :: response
    character(:), allocatable :: json_data

    ! JSON data we want to send
    json_data = '{"name":"Jhon","role":"developer"}'

    response = request(url='https://httpbin.org/post', method=HTTP_POST, json=json_data)
   
    if(.not. response%ok) then
        print *,'Error message : ', response%err_msg
    else
        print *, 'Response Code    : ', response%status_code
        print *, 'Response Length  : ', response%content_length
        print *, 'Response Method  : ', response%method
        print *, 'Response Content : ', response%content
    end if

end program post_request