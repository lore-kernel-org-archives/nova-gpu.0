Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020076.outbound.protection.outlook.com [52.101.196.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B1D277C88
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114604; cv=fail; b=areTs0SVwCqQI8MF1rv9ie4O4RgD1q2Onq2m9e8gGRwcH3cls4WKp7bjj5RogTmu0+a8m57W/l4toP5TcFpreA+nrjeLtDZmlNmLFR5zYiQYKQ9kDraT9r4iu0KC95iIy98ZyHRISa2Jj6UztESEiKhnTO/IjLqFJRL1lRVQh1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114604; c=relaxed/simple;
	bh=ZD0jKbmUoQ+IyV9m+i7kHHXjRPSifyFaT/bF5aibRWc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Gn50lCggWsUZFB4AMbAxQQSRrD5CdEmksxvZ6IlTKP/hSW62FxqANfpGQ23vyiUhBnIEi6OFu+4TmLNHJJ4Ee44cAYsIkkBCPYB3bjMvQ0Z+NjBiSxuf2ckkLGhEIa5L9QYmaONGH+PR/AvXkXGPOSJHxJpkDf45+UT1pTvAY54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ihiq6L+K; arc=fail smtp.client-ip=52.101.196.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ihiq6L+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB+REcZfN7ypho7jW475FE5vM0f7Lb6TYPQaUk4hy2k0olWJ3WYRxOn4bf9G7Lbl3oz89tp08rHIgib3bTGkFW74Cfk7YvliDsULt/IFKIZCnqJt3vM2KRtJCpQGxtQFWJgsxW75C/L+G8j1y6E6ZYKn1Cf198t3525Nvz2UuRvGC1LtwWqWqn2IM5m1++c9nryDoJNOCiX8DF5XmUF03u9VjlAWeftCwNFWSFVljm6stjeTLy+PT/BU/EHaaBQmVxF9cf9x+Bt8YokdGJKh/mCWs9BbUbfZQxDBZunvn3pbmpUGh83B9aLsApO/tLh/ZzBR0WTX8mxow6Oc8/xE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6S6EJohTU4slQDlDo/NEDv73s77b+mEXMT9fCgiN1w=;
 b=yMNBHfaQsnNxm6zhpeOArpt4PzSWmooEJixu0wL77i+/elu3aLRq25JkSZa/ylokqD1sQpwBbQgxZZhd59hXg/0GsvnI3d3B7Fle08ayvOMSnJ1ZFbncD6o8M6w9tn+oJL6kAkaohCSRiUksc8nFGnII2oFn1z2YNgfTKn6taeHpZ8u1Wg7wDHvXurAqP1wwKt8I1qmH8qWBANEYbq6x2O2OeCIxd4jIyuKf9c6ap+IS+SZ51zsdjIpHLuggv20RYahzZTi3pe8JOlTdbd4kZFsHoScQexCyCEX9Vu13L2RSA4R3Q0d6IXM4yeqj2UuvMxmBv2xYyD6qDbuWX+8eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6S6EJohTU4slQDlDo/NEDv73s77b+mEXMT9fCgiN1w=;
 b=ihiq6L+KcbemfzGAv6ioBKoIHb3tVQ95FB05rKERLLZqfCY5SsbQIS5LHHyVdsvzJdPGhEtgGqa0GI82IxeByhk2Ku7fJMUFi39XoWZ2QljJD8COwfAvMZ8rJaZp7M4Hj8JIbWlZXZ7quTIOub3eamFdva20FSw6bCYNJb+W1A8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO9P265MB7429.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 18:03:19 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 18:03:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 19:03:17 +0100
Message-Id: <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-2-ttabi@nvidia.com>
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO9P265MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 3228fe46-66bd-4518-d705-08dec71a8ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10070799003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TANJ8R5w/CJGLtl92WgSS/5cYWBGicJ/eVItmWUyRtcmJByKSJxaMy2CkyTFKY6xJ9ypqbAmrDlzLKINzZ/xgU2fAcfxVGOIaQGxu1npuZNkUh6oF+RIfYSsNV3lEwG0CpgGJZDybQOUKS5m5oEcqjFHZSO9BGF7bv1ftYo5+gFl5Nyk+dS6DduktihaLITWPmKOH2vtpTo2oNeOFs9x8iV/4f8fmcBxOiXIuZR9mqopf42QlLDKEb35fs9it00R64ZiW1LxzrRIJroeTeeyZ7ZgNkPL4KVMcnoAPWHeaDd8Lbf52biD5k0+xED3axfHMaqIk7VuUkYvv21cBx/WaNlgAsap/5Oy4w+vSdbaBtEGmxkV8u/qNUG1Q7MqMnhLdgU7PN26l1UEWHFpWbpj8/yajs3QotOUN3oq/qj3HM1U+iZ4zpeQ8US7PaKleGWTTyjT3NQmci3oX+4QAgmGwMSJMFjroZo3McPQOsnWrgAAM0jsLKU1fiUPDqQ9Qlyv3DRxrcy0wRh5NxLYu+tVt8pQS59rbECiOMddaXXbOXuEgbqJ4FCfoTn8IuhyJEkv46zX1H1hg43Jccfsuj56xNzhMK+NKymQS+UbT3jgfXujeWFBw7tmefn1BdgwbQP8skVv0BLqteo3MON7Fgin4K60pjKR2FnEq2vw3HpppRRwQ9C8+JtSaWJZ+Aup+Ehm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGxZL29NQXltWXNOYk5iTFVUMnhVdEE1SGoraFgweHAxc1lQZUZYNVFGYTg3?=
 =?utf-8?B?bXpzVjJ6dlA1amZCaklXejIvMU5TdUtTeHprVGlZdWtIc1RrdlExV01SVmta?=
 =?utf-8?B?QkU3RzJzQzRvblRKRi84ZHRzS2JLZHZvb1FXZGpLQUE0TXhiSjNlUHlZQnhs?=
 =?utf-8?B?UkVROFczcmtDVmVmanhDN3F3NmRmTUE4OWNLbTlZNmZYVzk3MFJXUmFETWda?=
 =?utf-8?B?aHk0aEYwYk9uVFFFenR5NUJVbENlZEtPcDBXcVdVT1dVc01QQ0RraWZmVVFr?=
 =?utf-8?B?b3ErdVdWOTRkdHF2YXBiZ2dBTmRkMGltRVRIYWlwaFhOMEs5c3htUnlzNmM1?=
 =?utf-8?B?Q3dSdGIzUEp3REdkZGZxcHpBaW1HSlhGa1ZSNWU5MTI5YzErNzJIOFc5eHZP?=
 =?utf-8?B?Z3A0RkYzQ2dtNmJaNHdKaEZybFJvOWVuZEk2c3dldkFKWHBJcy93N0t0QUV2?=
 =?utf-8?B?WVdBSGNQbkdIQ3J4cVYrZkhQSjRuRzJkN29QUndSYzI3SjNFUlZ5RU1DKyt0?=
 =?utf-8?B?a0tRc1B1Kzh5TVMvOHZpRTJpWDBkcGtNY0RhWGFmZTREMEt0VzRuOXc3alJz?=
 =?utf-8?B?Z05KZExtbFNrb0FGcG9pdXVLeXpCd3N4amhncW9VdElHUGRhMGJoRjhSRE1I?=
 =?utf-8?B?bzEyUm51SnFoQ0IzQTFlc2dWQlJMQ2srZUpQOG9ibEluS2dqSnZJRWpaaUQ1?=
 =?utf-8?B?WElSK3RuWmpkWTVqUkIvQ2lrK0NzZjRUbjNwcFRCU2NUMC8xOFFTQnk3OGdO?=
 =?utf-8?B?ZU00Z0lickdIU1M2Qm1oTktHbmRIcFl6WCtta2VrSEEzODBlclhZTUQ1SzUv?=
 =?utf-8?B?eGRubWdSaHgxQ0U3bTkvU0J0K1hLT0l2ZmNRMFk5SlhZQzVIVmRwK09XN29B?=
 =?utf-8?B?b1d1VFB2MlNOZTdPUU1ac1Qwa2QreXFlSXljMEx3cERqcUxvdmVZMi9IeDgx?=
 =?utf-8?B?NmFvNUtWWkJNREplR2hpeWtMbzMybjlZVXFhc2VVV3RoMmJEdXErN2h6aDNV?=
 =?utf-8?B?MG1WOVpRK3Z6dkh4WDNhOXNPQXFLMGJWaHpiNzdqcDBxK0kzR1puSXFzT0Vm?=
 =?utf-8?B?N284MWtuZHdDS2NPZGVIN1ZNd3pjYVpMaklLUmtyMHg2aVEwSHJiY2twZ0Vq?=
 =?utf-8?B?bGFScExLNGk0VC9sNzVnTWdTTjlUTzdZL1Nzd3A3S1cvM1RlQU4vS3JzOXgy?=
 =?utf-8?B?cHlnWmg4TjNEdWVhR01ORVd5ZVl6ak5hdmxsZCs3ZmdwcTFrUDg4VGZtNDVX?=
 =?utf-8?B?NEQraXhkZXEybVZxNDNNV0FxSXFyWjJYUk5ZY0NXSHhvU21GYXJlc3NTYWh0?=
 =?utf-8?B?T2t1dHRKbmdiaDQvMTJRUloraGJDTWNIeE5SSEtPWDhMKzZpNTJKaVhuUmtR?=
 =?utf-8?B?NXlyOWpjMEFTV1VRS0t6KzhsOXZsNnhmREhITmIzMnFhaUVldktZSVhKbWda?=
 =?utf-8?B?LzRHdk9ZNVlaYUI0VTFRNm15NHlTZU9nOGVualNrRXV0SUdzeHlWeWFMWHFL?=
 =?utf-8?B?VUhYQnB5b1I0L3QwLzZKQkhJV2lBN0owTWw0c0VaeVdSY1ljUkpKSE9xOGJG?=
 =?utf-8?B?TE8zUnhiT1k5N1hoMVZoZGJiYVB1K20zSnRMYlNxVFlvc0ozUG8xT0MvWmpS?=
 =?utf-8?B?cExpOWh6bzE3Z3UzUkhzQWZGeFdLOTFDT09hdkhkQUxjUTdmTk9BazhJOUZy?=
 =?utf-8?B?dGsrWVQrYXlCMVlMNmtSK0ppcXFaUnljcWNPNXJPSkNWNGpPYjFiU0xyRUJ5?=
 =?utf-8?B?d2NNUE16akZWaEVyVkZWTGd6S1NXbkpLejdYOCs0MDJ4UEl2Y1dzZmZFbDhx?=
 =?utf-8?B?VlM2ckV2ZEpJMUpvRytHTndTdk1QVzRDRndnU3BJUG82MEswcFNOdjBaNTA1?=
 =?utf-8?B?eitXSW02U3NnOHNFa2V5MWs1UUdjVGpuN3gvN2NJbFF1Yk9oemkvRkFjOHlY?=
 =?utf-8?B?VFZPa0RyNXkvK3FUQnhDVmZNTlVKVnFBcm54ZUlzTnkxSzQvczFaMDVlY2V1?=
 =?utf-8?B?NDMxZ1h0SlBHVDBOeUdpZVR6VTRMOXNFZnVSUE1wL01RcXhYMTZIdm5iL0xD?=
 =?utf-8?B?YWtVZmhQT2NabC8xTXY1a0o1Mzd6YWVwTTAzbGQ4VVUyZ0NUQnlLdXMySTRz?=
 =?utf-8?B?VGJMV0ZjSjhPZXBlUkVtdDh5dUM4cVhDOUR1NGk3SnNHZVVuQXA2eFRnVXVC?=
 =?utf-8?B?dmpDVm93YkEwa2FBU29kL05DWnFuSGM5bkl0WXZzRUZ3TEdXczZDazU3Tkdr?=
 =?utf-8?B?LzVBc3NWNXlYbnBQSTlJMC8wNDg0R3Q0VjJLWThVRkNuaHBzNnN5cHdCUlVX?=
 =?utf-8?B?RXM0T1dwN2YyazNOZDZ5enljdk1oYUpFRExURW1ieTRDY2FmdFNxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3228fe46-66bd-4518-d705-08dec71a8ccf
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:03:17.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kgqgmsu+8n3idVh8VZqgv1XV5cmcisWSkKLHbw/hpJY8NiQAwvM9ynOY2o9lNWM2GSFfeB34h70V5SaBkJPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7429

On Wed Jun 10, 2026 at 6:49 PM BST, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..d2ffaacc2d43 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,51 @@ fn drop(&mut self) {
>      }
>  }
> =20
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the number=
 of bytes
> +/// written is returned. The caller accesses the data through `buf` itse=
lf.
> +/// See also `bindings::request_firmware_into_buf`.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as an
> +/// alias of `buf`. Since `buf` is `&mut [u8]` and the returned handle d=
oes not borrow it,
> +/// the caller could mutate `buf` while reads via `data()` are outstandi=
ng (and
> +/// `release_firmware()` does not free `buf` anyway). Releasing the book=
keeping here and
> +/// returning only the size leaves `buf` as the single owner and accesso=
r of the data.
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Re=
sult<usize> {

It looks like this API design is very prone to misuse. Patch 5 of this seri=
es
for example does not check for the returned size.

Also, I think people might just write `buf[..size]` and then it'll panic be=
cause
`size` can be larger.

Best,
Gary

> +    let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
> +    let pfw: *mut *mut bindings::firmware =3D &mut fw;
> +    let pfw: *mut *const bindings::firmware =3D pfw.cast();
> +
> +    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings:=
:firmware` pointer.
> +    // `name` and `dev` are valid as by their type invariants. `buf` is =
a valid writable
> +    // buffer of `buf.len()` bytes.
> +    let ret =3D unsafe {
> +        bindings::request_firmware_into_buf(
> +            pfw,
> +            name.as_char_ptr(),
> +            dev.as_raw(),
> +            buf.as_mut_ptr().cast(),
> +            buf.len(),
> +        )
> +    };
> +    if ret !=3D 0 {
> +        return Err(Error::from_errno(ret));
> +    }
> +
> +    // SAFETY: `fw` is a valid pointer returned by `request_firmware_int=
o_buf`.
> +    let size =3D unsafe { (*fw).size };
> +
> +    // The firmware bytes are now in `buf`, which the caller owns, so we=
 don't need
> +    // the kernel to hang on to it any more.
> +    // SAFETY: `fw` is a valid pointer returned by `request_firmware_int=
o_buf`.
> +    unsafe { bindings::release_firmware(fw) };
> +
> +    Ok(size)
> +}
> +
>  // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, whi=
ch is safe to be used from
>  // any thread.
>  unsafe impl Send for Firmware {}


