using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LaserMove : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
    public float speed;
	
	// Update is called once per frame
	void Update ()
    {
        transform.position = transform.position + new Vector3(speed, 0, 0);
		
	}
}
