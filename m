Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12A390226
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386980; cv=fail; b=OBbu8spIK1403NsG1gR216ODGNU9xTKdZ2zy/Mi6J40dR1dPKrkIbECQ0jc38ZexWIOyWIlJQQ+2uF2sSgymCdVWho4blWxhZg57R5j7Jxfm9dYM+blDAKerUQELVQvBNcUi9kQfMTWuKWJY14tqnn9zbz+leXp7sNuACZFq9HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386980; c=relaxed/simple;
	bh=HrDDkj0/fZOlGPmVxsUltONYLGTlwHjyMJbo1DhE+zo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S7tX0JDtTI98PKvpfAziPLPpp5lrQIo2kpYkrevqopSEIpHIHr6HE3OdAvdWALwtPhtkz/1JymQ/d29lGC2UMxl5U2Qu3jHNCrONnggI4txBXKJEJKSWc9bfDAT2goTWpa4hjJYxGe5pzwXueIMKEb82gX8DFSv5vBxqgXahU1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=to6rcAno; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="to6rcAno"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsrjqkq2WqMiLUZdeptjlEPlJh/9sMmhVE1QuUa009fmbtYtnUfPyyOdUF+CYqyMYtc2DRgO7lhcC6k+z9I6KYRrDyeGRSjbFXEfb36VNDkCX0A/El0n7CI/Qd0tTrcZdi+OwYvC9OeUiwxQWQiwclQ7Q6ihfKFDxrdgxdQoUgYGfYidCSEDNWJ/bJ5aXCnBLsag2rzmPboPvDy0G0BxSa12x0dMAveh4zMfLvciMG7c3YEKSs/WJjek6wSRHHML8czvwn5KDmng22gyE6rdDKFXUYdDKm0d2krVWfwfNAh8wtzZbMR4juT2w14P1Javi0bXiS8BAjj54zaqI431Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9DYDu7DlDbyYj10AvQySj3mLMV0LZG5lhrK6sXYozg=;
 b=m6dRJuOYgOWWsPdyQN0YCMp252zI2x6v33iuM/nvLcMunFXkMLNahICOu3+sDZVnLHvnWoU1Od3u5vmsJMuox1au7hJDv3CDuyIZHKPQAdEYDZxdY2F9jmJ6jsR4QfZ3ZXEIo1/w1YI9GH1ai+QZqoS9bV1JOmj/xHUCdaaENEmWdKMYaJj0b8JvvNhLaunO9OiRZzKjho7U1uhfRW+oD2MVRR+TErMJPetinSfMCwur+hXx0UWCAcnxY1f6vLOyVtDFMWoT6UBFYnW+A/JA2IOAwn1YWyEXpeJaQVtTGa9fSzD7c2GFPs3n0IBhsQG76GFJpfRJwn4ksE9c6mEp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9DYDu7DlDbyYj10AvQySj3mLMV0LZG5lhrK6sXYozg=;
 b=to6rcAnosfJ40a1Xa+Skl4j808P8cXBAybGGutlH32qvNQDNBuVYDnhAxc9Aupue2vxx6sSQM9wKsKUIzuQq/6BwiyYGiNbMXlcU51OWWcffQYZcna46lfAh2E/JG/LJ7zJNLpg8nWKDTU6hpn5aFbdJhHC5xE1xn7a+sw64eWX839fwdI7A476O4CeCanDeSb2+xAIDCvgL8zn/zvdO5ufCr4gO4h7ng8o8jHZ77XTnXeLSalycixAOhX3/1tfQWCbb+PDvjyhTffBcsK58d/oNVB05BiCJB8M3y2b8owzDGwpQrS4sr3Fgi+HyZq7IXzNrEFpZDWGtHkEgelkNdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 07:56:07 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:56:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:56:02 +0900
Message-Id: <DIYEI7DXE32X.3G5GWVMQNQ4PM@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-13-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-13-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c65864e-372e-4c5c-fbb5-08dec07c66c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y1jYFCvWSM9TxC32XxU2gw/bhWYLsHc9j8M5zkVGY8U4Pr6+Cv0lEyixdAXagARqT7eF0AeRMkuu3+mJdSD6LM6G+Kx5owakb3II2wxw/EsyjUHNbCjiWuKvn3J/lO7/Xe/JS2RgzWaQKRsOfbVr3ll61hL9CfVMW2zEf5bqrd6JeMF8Spd0OEgpQPeBaJDUcIAPfVYiR4qKsmPcz73X8vVJ3B3Id5SE+NttWKF0cMS+P0Q8Jg/7KC05uNXzksyi5AReO5+EV/UqsSFJWEwBDR84T2mooQIMJe8008hKV/NUMCuob8UHKj2f86ZhVuQ0aCiPVJA9RFD/ohbeN0eOqSmMklQ9onUwmIcZxU6ZzB8OsfUz8XnEYLuQa4eBZdWiVA7KO97uWImXJNq8IQvP0iTn7b039eW56qvQd5nN2aOQj2yX1jBzzxo0W/tjdsYEbXurKVdiauisx/AUfnil7ZBGeQ4CgXgGZXn2H+ZjzELFBoZDXr97rd3wyJyJKRBUm3WXq62DHKLOSYAHf3lePFwQvP754dIYXsjN5QF3h6EjGRlprKdZfX05VUd3mE82Tm8gD5zAgfSkc7r0v92Ovw7FHoiK3qLLOBy+1K1YhACOqr5x+N23Pyl2QvW5VPJrlKQmbKCHjoVfFzPj05GHYcnCcw1aBnuXjVxR8R5SGLAJdeEc3D22jmL3U/1BMSjX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlI3SWJhdjNUeWZrNFFRSVYvWXpXak9yd0JOKzdNUk5ZSHBaWi9sUElGWHY1?=
 =?utf-8?B?bnY5KzZDKy9FclZOOFB5Tm1rNG1GREZQUnFkdU5lWDljUTgwbk5vNVQyVXRR?=
 =?utf-8?B?TmxGQmlIYS9kRlYvcG93MnZRcHhPYUc2dmdnRm5oVzZ6M0RQZ21vUnI3d3NZ?=
 =?utf-8?B?c1M4OWVGUk54aFFKdkZKM3pBNUZMVnIwOTUyT1JRZ1NGWFlHNTdnVHQ0a3lL?=
 =?utf-8?B?d2thSjkzTkJRZitmMWNMSDVKbElSTXBGaGU3Vk9yYVRkYitMSGdYZUw4Y3Zs?=
 =?utf-8?B?SElWUUV4M1pFc2R2SDcyOEF2RldTcWRqSlIwdkltdHJHdmg1NUZIWHZ4N3Fx?=
 =?utf-8?B?cEVQZTV6ZkNLMjh0bUlsaWJIREhvbWJFRTk2U0VDQzJmZ0FYVUpxN1JVUjhO?=
 =?utf-8?B?UWNrdjlNWllndmREcmNjczZvd3FNa0sxbnhSbDhTRU95TnpBRlRQRVFBVVJD?=
 =?utf-8?B?d01ISzlzM3JXVXljN29hSmNNdDRNMFRMajF2YUFFZmd4ZlJSUVZtOWlvbHRi?=
 =?utf-8?B?TEtEdXVhWlN1bFgyaVBIWmY1alNOcUg0Q1U2VUE4T1FwZC85NjNaTzBTNDJN?=
 =?utf-8?B?eC84amNmNTd6Tm1aL2h0UXlZUTdwTkExRGgrU2JYaUFQNnZKeFVZbUpHSlNT?=
 =?utf-8?B?RGR6U1JxdTZ2b010Q0wvZDJBc3diY1k3RDl1c2pQTWtWM3BOaWVBVjlCU0cr?=
 =?utf-8?B?WDlIQkcxckI0WjlCSXBWSCtIUDdsVngvT2NuSmlFbVd3NytudWdVWlNOaTRM?=
 =?utf-8?B?MW0yMVFFWUVWdWxiaEY0K3hjWGFHcjhlM09GeHV0TVcvUmI2bXlQMlZPUFRp?=
 =?utf-8?B?OXlhYjR4V2c0aEZCUlRia3oyTjV3UFNiWDZJWjlxWm5sWFd1U2wxbEwzOGVB?=
 =?utf-8?B?NUZIOHcyR0hSTlZvblB4d0pzWDBaYU9MNk1zTzZvQmJBZHE4TWJKNXF6TkJI?=
 =?utf-8?B?em9DaiszWVhRYUFpc3RScHR4ZUd2L2RuQW91NXVGMFNvMCtnNlllUmxGSlFL?=
 =?utf-8?B?Y2JYVlNHMGVhMjZBNzVjRWsrcytJbEdWdFYrY3lGa1RnOWRSUHhtYzEzVThz?=
 =?utf-8?B?dmoyTWVld2hhcXVBL1loVEJCeGV4amZDRkptb2FkcnBtWUd2T0U2b0hINC8z?=
 =?utf-8?B?RzRhVnJnK2pPNkRzOVV2RGNQN3dtQ2grMDZubG9tdnNxQVY3T0pkYTN4YTRS?=
 =?utf-8?B?VXMyMmRkR3RubzcvK3RHMjF5eDV1UGwzVk55WEZQTWx1VmRLQUlkdHlWY2ll?=
 =?utf-8?B?V1ZrUU5Wa3pkQXRHcVowdSsyRFNoLzhid29pVE1QTXdIMDZRR0VHWEZza3R5?=
 =?utf-8?B?MWZ0Z0R0NkEvRlM4MGd0VHVZanJYOU1renNhaDREYUQ0NjNHYnVacHR6OTIw?=
 =?utf-8?B?RHRLVW4wTUNKcFpSZ09URHR1ZmhJNW80YUg3L2JFdVU3bVlpOEVlRTUraVJl?=
 =?utf-8?B?c1h6YjU3c01YeGxXa1laK2R6cmZEOXZsUk9MODNMVUVUUFovVFllcTZvN0lJ?=
 =?utf-8?B?Z05OazE2WDh3WU1sVk45bVBtREhxSWhVa2h2OGVWYStDdmZMZFpGVmtjYVFt?=
 =?utf-8?B?MzhPY3Q4MFFFQk1jdjdDTjk2OE9UZFhSQVZRUEsvSDV1aElpb0pJbUR4dUhH?=
 =?utf-8?B?TTIwZk5CWHVsdTQyNlFqWUM2WVFnMHM0R1dyaUxOc3pYOUlVR2h3T0xLSExF?=
 =?utf-8?B?Z1Jia0w5bThLUnZEUmFXenFZcE44dHNlWXYzSU1HQUZEVmtFSUNTcnNkcXYy?=
 =?utf-8?B?akpYYXB5dCthR2lxMlhCMGE1QVY3bjZiU2Q4RlVpd2hDYzJUc2k5ZkFIOWIw?=
 =?utf-8?B?OGkwRDVrbjU4S1R2ajhHbGtRTWxickhNQ2NzUGROM2U3UHBuN1BmQXJuUU9X?=
 =?utf-8?B?ek9EZERYUFIyTWlMbmkvbEhiVXFFTktmZ2ZXaTFLakV5cWJsYUpNMzFoTDRw?=
 =?utf-8?B?c25FVnJpa1VxT2RJZlRtdGUxc3ZRZTZteFdUUVpEVUJRTFZGR3Z3QVJMSWpY?=
 =?utf-8?B?Tzh2M28xZU5mb3VNc3hWVFNhRmRPTm5TcHIyL0lEZ1ArZEw5dmRoMHpJUjZZ?=
 =?utf-8?B?MTEwVHJTYzZTRzc3U3VUei9hZy9waVBBVHcxcmVURTFHRnRERWF0Sm0yWnJw?=
 =?utf-8?B?d1d5NS83K0w0TEhDUVpKYkNwMzZmc09kaVhjaVFyWHh6eXQwcXBiL2pyRXhD?=
 =?utf-8?B?NG1CMDA4Vks5ZTlhWXNTOVdYQUJoUS9RaHZMaUoreGtTNEZrdzFJZ3crLzRU?=
 =?utf-8?B?R1hmOGdDc2FNTnlFQ2NWOHlwZ3N6SGFQdElNN1d6WGFmd3luU2xySU9uMEd2?=
 =?utf-8?B?WmI1dTZmR3pibjZQZHlIajNGRXhsc0I3bG5LcUwvNGZhT240TVJOemNYOGtY?=
 =?utf-8?Q?buiSs8Q61BY4kKfRZ6zds1Zt5IZEQLYgcqdYqrT8g/vJN?=
X-MS-Exchange-AntiSpam-MessageData-1: nwSgy2WbpXZ65A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c65864e-372e-4c5c-fbb5-08dec07c66c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:56:06.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnvZk1BKcXExKv7hMMMNLyfPMGujBmDIrg8MjyLZCHVkfWlAOKfuZeznKRcXEvUN3QzWXnVi2ZUm57TfYXTi1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
> driver must wait for FSP secure boot to complete before continuing
> with GSP bring-up. Poll for boot success with a 5-second timeout, and
> return the FSP interface only on success so that later Chain of Trust
> operations cannot run before FSP is ready. The interface owns the FSP
> falcon and the FMC firmware.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs    |  1 -
>  drivers/gpu/nova-core/fsp.rs           | 73 ++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++
>  drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++
>  drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  6 ++-
>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>  drivers/gpu/nova-core/regs.rs          | 36 +++++++++++++
>  8 files changed, 187 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index c4a9ce8a47f8..d9f87262e8b1 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -15,7 +15,6 @@
>  };
> =20
>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
> -#[expect(dead_code)]
>  pub(crate) struct Fsp(());
> =20
>  impl RegisterBase<PFalconBase> for Fsp {
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> new file mode 100644
> index 000000000000..f3524137d9f7
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! FSP (Foundation Security Processor) interface for Hopper/Blackwell G=
PUs.
> +//!
> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then =
FSP, then GSP.
> +//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usage=
.
> +//! FSP handles secure boot directly using FMC firmware and Chain of Tru=
st.
> +
> +use kernel::{
> +    device,
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    time::Delta, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    falcon::{
> +        fsp::Fsp as FspEngine,
> +        Falcon, //
> +    },
> +    firmware::fsp::FspFirmware,
> +    gpu::Chipset,
> +    regs, //
> +};
> +
> +mod hal;
> +
> +/// FSP interface for Hopper/Blackwell GPUs.
> +///
> +/// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only return=
s once FSP secure boot
> +/// has completed. It owns the FSP falcon and the FMC firmware, which ar=
e used for the subsequent
> +/// Chain of Trust boot.
> +pub(crate) struct Fsp {
> +    #[expect(dead_code)]
> +    falcon: Falcon<FspEngine>,
> +    #[expect(dead_code)]
> +    fsp_fw: FspFirmware,
> +}
> +
> +impl Fsp {
> +    /// Waits for FSP secure boot completion, then returns the [`Fsp`] i=
nterface.
> +    ///
> +    /// Polls the thermal scratch register until FSP signals boot comple=
tion or the timeout
> +    /// elapses. Returning an [`Fsp`] only on success guarantees, at the=
 API level, that the
> +    /// interface is not used before secure boot has completed.
> +    pub(crate) fn wait_secure_boot(
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        chipset: Chipset,
> +        fsp_fw: FspFirmware,

What about constructing FspFirmware inside `wait_secure_boot`? It fits
the concept of having this Fsp object own and control the FSP. This also
matches the pattern of Gsp::boot creating its own GspFirmware.

> +    ) -> Result<Fsp> {
> +        /// FSP secure boot completion timeout in milliseconds.
> +        const FSP_SECURE_BOOT_TIMEOUT_MS: i64 =3D 5000;
> +
> +        let hal =3D hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
> +        let falcon =3D Falcon::<FspEngine>::new(dev, chipset)?;
> +
> +        read_poll_timeout(
> +            || Ok(hal.fsp_boot_status(bar)),
> +            |&status| status =3D=3D regs::NV_THERM_I2CS_SCRATCH_FSP_BOOT=
_COMPLETE_STATUS_SUCCESS,
> +            Delta::from_millis(10),
> +            Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS),
> +        )
> +        .map_err(|_| {
> +            dev_err!(dev, "FSP secure boot completion timeout\n");
> +            ETIMEDOUT
> +        })?;

nit: this can just be inspect_err(), it will be ETIMEDOUT if it times
out.

> +
> +        Ok(Fsp { falcon, fsp_fw })
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp=
/hal.rs
> new file mode 100644
> index 000000000000..83d1e7daa998
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fsp/hal.rs
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +use crate::{
> +    driver::Bar0,
> +    gpu::{
> +        Architecture,
> +        Chipset, //
> +    },
> +};
> +
> +mod gb202;
> +mod gh100;
> +
> +pub(super) trait FspHal {
> +    /// Returns the secure boot status from the architecture-specific `N=
V_THERM_I2CS_SCRATCH` register.
> +    fn fsp_boot_status(&self, bar: &Bar0) -> u32;
> +}
> +
> +/// Returns the FSP HAL, or `None` if the architecture doesn't support F=
SP.
> +pub(crate) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> {

nit: this can be pub(super)

With above changes,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
