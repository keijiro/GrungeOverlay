using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class ForceSquareAspect : MonoBehaviour
{
    void Update()
    {
        camera.aspect = 1;
    }
}
