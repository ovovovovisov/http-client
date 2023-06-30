module http_request

    !! This module contains the definition of a request_type derived type, which 
    !! represents an HTTP request.

    use http_form , only: form_type
    use http_header, only: header_type
    use stdlib_string_type, only: string_type, to_lower, operator(==), char

    implicit none

    private
    public :: HTTP_DELETE, HTTP_GET, HTTP_HEAD, HTTP_PATCH, HTTP_POST, HTTP_PUT
    public :: request_type

    ! HTTP methods:
    integer, parameter :: HTTP_GET = 1
    integer, parameter :: HTTP_HEAD = 2
    integer, parameter :: HTTP_POST = 3
    integer, parameter :: HTTP_PUT = 4
    integer, parameter :: HTTP_DELETE = 5
    integer, parameter :: HTTP_PATCH = 6

    ! Request Type
    type :: request_type
    !! Representing an HTTP request.
        character(len=:), allocatable :: url
            !! The URL of the request
        character(len=:), allocatable :: data
            !! The data to be send with request
        character(len=:), allocatable :: form_encoded_str
            !! The URL-encoded form data.
        integer :: method
            !! The HTTP method of the request.
        type(header_type), allocatable :: header(:)
            !! An Array of request headers.
        type(form_type), allocatable :: form(:)
            !! An array of fields in an HTTP form.
    end type request_type
end module http_request
