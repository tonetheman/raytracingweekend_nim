import vec


proc test_init() =
    let v : vec3 = vec.makevec3()
    assert v.x == 0.0
    assert v.y == 0.0
    assert v.z == 0.0

    assert makevec3(1.0).x == 1.0
    assert makevec3(x=1.0).x == 1.0

    block:
        let v = makevec3(10,10,10)
        assert v.x == 10
    block:
        let v = makevec3(-1,-1,-1)
        assert v.x == -1
        assert v.y == -1
        assert v.z == -1

proc test_setter() = 
    block:
        var v = makevec3()
        v[0] = 10
        v[1] = 11
        v[2] = 12
        assert v.x == 10
        assert v.y == 11
        assert v.z == 12

proc test_getter() =
    block:
        var v = makevec3(3,4,5)
        assert v[0]==3
        assert v[1]==4
        assert v[2]==5

proc test_unary_minus() =
    block:
        let v = makevec3(1,2,3)
        let y = -v
        assert y.x == -1
        assert y.y == -2
        assert y.z == -3

proc test_addition_assignment() =
    block:
        let v = makevec3(1,2,3)
        var y = makevec3(4,5,6)
        y += v

        assert y.x == 5
        assert y.y == 7
        assert y.z == 9
 
        assert v.x == 1
        assert v.y == 2
        assert v.z == 3

proc test_mult_assignment() =
    block:
        var v = makevec3(1,2,3)
        v *= 4

        assert v.x == 4
        assert v.y == 8
        assert v.z == 12

proc test_div_assignment() =
    block:
        var v = makevec3(10,20,30)
        v /= 10

        assert v.x == 1
        assert v.y == 2
        assert v.z == 3

proc test_length() =
    block:
        let v = makevec3(1,2,3)

        ## TODO: make these tests assert
        ## 
        echo "test length: ", v.length()
        echo "test length: ", v.length_squared()

proc test_add() =
    let v1 = makevec3(12,14,16)
    let v2 = makevec3(1,1,1)
    let v3 = v1 + v2
    assert v3.x == 13
    assert v3.y == 15
    assert v3.z == 17

proc test() = 
    test_init()
    test_setter()
    test_getter()
    test_unary_minus()
    test_addition_assignment()
    test_mult_assignment()
    test_div_assignment()
    test_length()
    test_add()

test()