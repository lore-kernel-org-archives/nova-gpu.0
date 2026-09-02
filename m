Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CC49F139
	for <nova-gpu@lists.linux.dev>; Wed,  2 Sep 2026 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359639; cv=fail; b=ahZCA5SlydBJfCVmElN1ERJTWB09EzYWlxNeMlJ8c7TJTLWKKInjhJFBpBf+Z5BpuS0h+JUG5FHtTG39DlCSduxTlmZGbvX0XRFKS3KufA+TLaMPiZ0mj9d99FyN2AnEAnfyYdlMY6AfhEdwoDFt99bU+ikOC0n4w1TvbZBbA64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359639; c=relaxed/simple;
	bh=YRQ3oUiy01fZN01YCHCB2jb4w2GR4kza9nZFnozvEis=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pOa3LERADCrBY7jQcUOA7jjF7ABL0XbaP7hsbKPD7EQ8n1+rkvPbMLBanw3CEEvBOIWbMuKo1dWmNRntM/HbK8n5fvprdH+Hng0kTDLD2Tk1IwtFLBDHHpYYWAXMfFAHziW9X6ohMlPBgfkFOoSLT0OWgmHh5pPH3C/JXvE3uYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kh1726RK; arc=fail smtp.client-ip=52.101.56.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kh1726RK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjvc1U2jVkfGQ7KQvoLU78B9tRoM3SI9/+JI1Sj3B5fhzxOHrG4Rh/AVJCW1+IuFzNuofmMKvA+DyLWfn6VWJqMZVqo3tfB//iRLQIwdnNfn5bjh7ABpkheHUWOi+MEWyImFthM7NeqAVEiY5Jz4I4uy+4+yw2xZ9lHaQdLZeaVYuN0US6AuFLKodX9TDJxzsdODmUfh3IECsSykdiD3uN+NuJ7Qlye1NLRhNqnDt9/x5siQ2OWYZ0H8hPntjlHNFcLNF4n+1XNFiwcvZHn+idVhJncL2cJQUG0NeWsteyESdK1O23EuW2VF41+4mHgPlTf4tUtH890Iw/3F4qUAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deiBicsp+D06oJqt+Os7gDto3c8bGphHgYJdttFeaMk=;
 b=ODXgLWLT9Ll6Yy9Scac5Lxl9ao+U55wMNM0AvXqnTFWCyG38genfgwba3C8omlxRnzGZBgoSWJQCA0U9owfR2cx4Q30PFZKtcMLCLJWDfAqE7rIQ6fgDuP5B//RVm4QD+jYI+ulVOLfB+XXbgUliSWRjtpgiXhxKQSRzj6S4bm7Isfr5cCDH8YZz5OhuU2hfJWSP8y7WgET9KnOZM5iPpnzvLHUE/S9HMhmuAF5D1XuHuhwKPwcWI1DDAQrjypJ5xsRaYB9LnstMwYDJdTe5a2Ii2AK3bj2APpDlUqrT9Dlt+yk1WbZ69LW/nSuA0rBUEjISTgs8cBU4tc5IwGHRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deiBicsp+D06oJqt+Os7gDto3c8bGphHgYJdttFeaMk=;
 b=kh1726RKlpkHJsRWdJa1uuMQrzWp/+3y7E7A6mLuJCGfKL7xH+vPYLwqrOVt0MEBt+4ewNTVNEH4n6IivWI9sRwsFJDdDqdVkuod2A5leFtrFZ5fa64eLx+4AyleeY7RNZtJyerK0d5gq5xVYjqqdDgtkDmgCS5AH83SB18dpUrhzycDhxoAngLHPJVsTScaGC6ZePlK7Xm7D6z4/l6T6jH5Os9K4Hny644aSWS4FIxPd5MGe+DCf6grm1ItJCrasvxRvwuzi9NTFTpsi82M8UIfqKbEge3X1DiOh3bhTMEcssBI/CCLs+niQWj4GERBxPMTj5Ip2ck2CFPvJ9g0fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:33:48 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 14:33:48 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 23:33:45 +0900
Message-Id: <DL4WKU4TOA0C.2FGP44BOVFHLV@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v2 12/15] gpu: nova-core: drive GSP events with the
 SWGEN0 interrupt
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-17-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6154fb-3692-4bf3-8307-08df08ff3378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|23010399003|10067099003|5023799004|4143699003|56012099006|11063799006|6133799003|7136999003|18002099003|22082099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	cVE1J56PM/ZG1L4t9E67gkpcDN5hSLsNG8c81wviGuKalYJUVGd+czRNsCDyp6BgIxawdA0ZO2aHhPq/8q0+rAXsI51XfSu2b9uhuIMT28W20JjZGDfsTpKiIgJGS4Xkezd9FJS+7ueEE/WuTzjR39GmeuGR2ig6vPF7SVzF/rraic5jWs9DYeLWZrMwjMbcLIJIYzckuzi3OMQKAPY3soAzVfBtMw1g+m+JeridL2+2L1R0t73oyxCSpF72wUqoD6zLKTnvfj926UQh5qrMwdMg+ENOdozzKfA/FzA1vOIr0ezLeiSbFS5nUzUQwwrri5pgUyA2HVREzLE/nlXE75rk09GQBLjLFkN0aKoAR5CbpXEUawnPnZuP0N7BVdHxDXe7ohrJFIQppiXE2RASykS5GZiAmHJjDsxFs53l8F4cp1XGOTmzx3p+gknUQpNxC1kbRWaqg9O9cXKWG0ApbdmXnpgrPTRPSSQuI2+tQK4q1j0yVPw9C1EG8bfZbuHRrrf0kHDRSA0DXCXDq3YCp3DsfjSqAj21fi3wuLHQhY4XXXrDydpZHeTidX7BJPISLuVepTZGYNUw4wFBA8ckadi2JfWq3tC1YVvqOfVynejvmoWmLo5Kh5PCtuHhSnuHPhuFLCU16fjvJzxKKM8QF79ZKD3bQ/8NeVZ7QB3I2Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(23010399003)(10067099003)(5023799004)(4143699003)(56012099006)(11063799006)(6133799003)(7136999003)(18002099003)(22082099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkxhWjVJZ1p3RlZqaHR5NkFDelhzZTQvc2hYdllqOThuanhjcEgrK2pnVklI?=
 =?utf-8?B?SkFaVTQ0cW9xekNpS1JyREo5ZTlHSld6TFNSYW1ETnh3Sks5ZFducTg4M21I?=
 =?utf-8?B?R3JwVlU5bm1rYm5LV1M1NVhxN3RRU3gyUUtwVnhLRmw4aVBwSlh1eGVmRS9V?=
 =?utf-8?B?YTVBVnhaY1NvS3pXZC9sTU5XcitOUHRsc1I2bnpKM0l1dytXNnduMUtqclZH?=
 =?utf-8?B?WERtTUNsYlY4NUFpRjV5bVBOUGQ0VHZJRFRRZlE4K2MrRU9XRDVPTWltblVp?=
 =?utf-8?B?cTFUbVZISkR4ZC9pMkc5TDA5WEIvT1NmVy9OZkNsdHFxdVY4dXE4ZG5HQWRU?=
 =?utf-8?B?Qm5YK0lJdXZwRG9SejFJdmkxemozSU1PaFhsWWViNEl1SkdYbWR1aXhxNWxX?=
 =?utf-8?B?aXAvamJmbHU1dzByNmFYa212NVBNa2hJRWxzQnRDNVBxcTJaWldhZlJ5ajcr?=
 =?utf-8?B?c2V6ODBSbjdPb2VDbXErR1VvVW12Wk4vUTNMQjZJSWlhckJlWWxGaGkvVGwz?=
 =?utf-8?B?Y0xwR1AvbW9hcW1DcnhtTDlVU0ZHNXkyOThXaC9PT3pWWC9ZZTNOL1E1T2ln?=
 =?utf-8?B?OEhJZzhsQllzN1J6VE10YW9lM1FMandXRlY0ZzdjcXFleTAxNUpRdWF6RnVn?=
 =?utf-8?B?OWVjb282c0RsblNIR01mZUx0N1N3Zk9Id3JnbVhLNXVjclUzTk1vMjlSTWRY?=
 =?utf-8?B?K05vRkFvcVBWblB3NEJHUTlsb21WS2ZEdm9LSyt0cm02aE1hZDVxVTFxdzF6?=
 =?utf-8?B?N3V6REM0OFNSb2ZWWHZWNi9vNDltR1FTeEhZUk51aGMyaWJ4SG1QTnhUSUpP?=
 =?utf-8?B?NzNzdE1USXdqMkhVTGJlOWJrcXJzWVpxQzBFNUpVSGplOXZwbUVwdFIvZEFr?=
 =?utf-8?B?VE5JMHpnb3lJVFNUTExaZU9RWEJzcXdPS1lLMXdocTBKdzI2Zk5xV29TREwr?=
 =?utf-8?B?WUI3czBzVGg3TTBSYnkvc05yVHVYd3F6Z2JkamovVTdPMkZhOFpYZ2tONTV1?=
 =?utf-8?B?U1paL0dXQ1QyY1R6djJVOXRiVVNJTlRjWE1FQ1RESDc1Qms3VHMzS3lLRm5N?=
 =?utf-8?B?M2wrUVVQRE11ejhOWjkxZmlwNVJSWVV3V0VzQ3FtSlNsNGo0Y0FLbzlxVTNQ?=
 =?utf-8?B?VWg3Y0wvNk9tR3NYU1F3a1BpY0huOVRxeEEzK3A4V2hKL2owK2tabG9BSmhH?=
 =?utf-8?B?WFpHODhMRVVxOG9SU21tN3ZJY3FXSU40djBCaGtCbjRBMUNnREhRcWZXazd0?=
 =?utf-8?B?Rk5SbTVBUXpJSnpFYUxaUVlVQ1IwOG05ZjA0U0tXQUdFNC9UN20yOW85dkF4?=
 =?utf-8?B?V2ZKRGlSdUxUSC9mS2xSNWp0cjQ1TDRyZTh4MmNZWWFrNitZbWlrbU9WSXJL?=
 =?utf-8?B?YTJLQ0FRTE5NaUtzczBhaHJLRzNMUjFiOWV2Z2RCUDdMVlBOaERoNXBIYlFF?=
 =?utf-8?B?MVhESTN3YjdhcEdJRDdibXdFRVp4VGU4VEovUnpoWFpteDF3dWg1MlpMdTBT?=
 =?utf-8?B?S2dIRDRvQ016bWNMcWRFa0tTc2hDemZuVkUzNjg0RzNwM3FqV25IMW1iM3lz?=
 =?utf-8?B?VGpTb1pIbWpsbTZGcEhXak8vYm81U0hOQmE1bjUwYzgyVWUwUUkvbHpXNTFm?=
 =?utf-8?B?eEZRZm5Ob09sTjN4T0xienNuWGxNZnFMcFRIeXlRZC9Fa1A2K0hCd00xN0lo?=
 =?utf-8?B?cXpOZ3FraDZhYit3dzlFb1BoQnVUQ1ljSEJ6TExGOU9SNjZtYS8yd3ZJTFdM?=
 =?utf-8?B?OVRMNzA0QXRQK2FxbzNmMCtHYjNCZkd2U0w0U0ZBeC9oMEo1R2JteS9yOUph?=
 =?utf-8?B?MjRVbFY1RHE3Z2ZQN013ZVZkYTJKSjY5QjBQb2R1YVNTeE01Um1PSXdOR1Ja?=
 =?utf-8?B?a3FzbHdMaGhBZFo2S1Vkd2ZmQko2Wm1UOFR2ZGZEaWRuTm1KVFVVaWxLR0Z0?=
 =?utf-8?B?UmJlekNTaGZnMElsMENienlTakxZOG96NURJenJiU2M2RUJtMzVNR0VEejA5?=
 =?utf-8?B?TWRHWnhHV25sMERKRFROSnVnTWxoT1NkbUhBamhmNlVXZEdlY2ZIby9MQTJD?=
 =?utf-8?B?M0trWWFnWUVKTjExVE03dlhabnJuRGR6WnZsOENkUFgvVVoxMkdVaW5NdGFS?=
 =?utf-8?B?dHFMb0dYMFdLUDN1dk1iL2IvVHlVSHdjMUhpaWRPeFU0NDFGenFMbVF4NVJ2?=
 =?utf-8?B?WHhzdVVDeVRrVGx1M0J6Y0VLTzNtUnpHYjMrY3AxVDlrYWdTUmNxSFhuL3lr?=
 =?utf-8?B?NkM1OWJjT0k5M3FXd1JWeUxIcjM3S0s4TmNmYXJWaFM0TTEzNm1hOHRjUkd1?=
 =?utf-8?B?Sy81eEtBTkRvbXEreGpwd3FvR3lHQmhCK0hyL3F0cnd0djBtbWNoSVpvZjV3?=
 =?utf-8?Q?ChRBpBAtRz2EYYjKE2O34gz9TtQLFCxqXsGkwRd3DDlC2?=
X-MS-Exchange-AntiSpam-MessageData-1: 3wd/LFyc4xISCQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6154fb-3692-4bf3-8307-08df08ff3378
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:33:48.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjEB9ln6YOBGgUuOWejbBehGIIdZezZQ/y2Ih+f55mFNeAkDh8YN+ewZgIRxbT3n03ycNoa66h48gPIi57TIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
<...>
> @@ -79,13 +97,42 @@ fn probe<'bound>(
>              pdev.set_master();
> =20
>              Ok(try_pin_init!(NovaCore {
> +                vectors: crate::irq::alloc_vectors(pdev, crate::irq::gsp=
::GSP_SUBTREE.into())?,
> +                // SAFETY: `vectors` is initialized above, lives at a pi=
nned stable address, and
> +                // is dropped after all fields that use `vectors_ref` (s=
truct field drop order).
> +                vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_r=
ef().get_ref()) },
>                  bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core=
/bar0")?,
>                  // TODO: Use `&bar` self-referential pin-init syntax onc=
e available.
>                  //
>                  // SAFETY: `bar` is initialized before this expression i=
s evaluated
> -                // (`try_pin_init!()` initializes fields in declaration =
order), lives at a pinned
> -                // stable address, and is dropped after `gpu` (struct fi=
eld drop order).
> -                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar=
) }),
> +                // (`try_pin_init!()` initializes fields in the order th=
ey appear here), lives at a
> +                // pinned stable address, and is dropped after `gpu` (st=
ruct field drop order).
> +                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar=
) }, vectors_ref),
> +                // Quiesce the interrupt tree before registering the han=
dler below.
> +                _: {
> +                    // SAFETY: as for the `bar` borrow above.
> +                    let bar =3D unsafe { &*core::ptr::from_ref(bar) };
> +                    crate::irq::gsp::quiesce(bar, gpu.chipset(), vectors=
_ref.irq_type());
> +                },
> +                // Register the permanent GSP SWGEN0 handler, which enab=
les the interrupt.
> +                //
> +                // SAFETY: `bar` and `vectors` are initialized and pinne=
d (see above). `_gsp_irq`
> +                // is declared before `vectors` in the struct, so it is =
dropped first, ensuring
> +                // `free_irq` runs before the vectors are freed. The reg=
istration is stored in
> +                // `NovaCore` and never leaked.
> +                _gsp_irq <- unsafe {
> +                    GspIrq::new(
> +                        pdev,
> +                        vectors_ref,
> +                        &*core::ptr::from_ref(bar),
> +                        gpu.cmdq(),
> +                        gpu.chipset(),
> +                    )
> +                },
> +                // Drain the messages the GSP posted during boot, before=
 relying on the interrupt.
> +                _: {
> +                    gpu.cmdq().drain()?;
> +                },

Can't these last 3 blocks (quiesce, _gsp_irq, and cmdq drain) be moved
inside `Gpu`? It seems to make sense in terms of ownership, as the `Gpu`
would own its interrupt handler, and things would be much cleaner as
well: there would be no need for the unsafe `bar` lifetime conversion,
`vectors_ref`, or the `chipset` and `cmdq` accessor methods.

Just gave it a quick try locally and it builds fine (with a net -20
LoCs), and AFAICT drop order is also preserved.

Pushing a bit further I could also put `vectors` into `Gpu`, which again
makes sense to me ownership-wise (because the set of interrupts we want
to serve might depend on e.g. the GPU architecture). The only drawback
is that I had to reintroduce `vectors_ref`, but that's a small and
temporary hack. I'd say this belongs in `gpu.rs` as well.

(after looking some more at the code) Ok, I'm now completely convinced
this belongs here. We could put these blocks right after `gsp_resources`
(which boots the GSP), with the benefit that the GSP interrupts will be
working to build `gsp_static_info`, which is obtained by sending a
regular GSP message! Right now we are still polling to build it, but
with the IRQ handler ready we could just wait for the signal to read the
reply. I am not saying this should be done for this series (let's do it
as a follow-up), but this is to illustrate that this is where the IRQ
setup should be done, not in `driver.rs`.

<...>
> +/// Clears the interrupt state that GSP boot left behind.
> +///
> +/// Disables every vector in every implemented leaf, clears the falcon's=
 SWGEN0 latch, clears the
> +/// tree's pending bits, and rearms PCI interrupt delivery. On return no=
 vector is enabled, so the
> +/// tree delivers nothing.
> +pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::Ir=
qType) {
> +    let tree =3D Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into());
> +    tree.disable_all_leaves();
> +    // GSP boot consumes its notifications by polling the queue, which l=
eaves SWGEN0 latched.
> +    // Clear it before the tree drain below, so the drain clears the tre=
e state the clear sets.
> +    // Messages already posted raise no interrupt of their own, and the =
caller's queue drain
> +    // covers them.
> +    GspFalcon::clear_swgen0_intr(bar);
> +    tree.drain();
> +    // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cyc=
le methods, but pre-Hopper
> +    // MSI rearms through a configuration-space write instead. An interr=
upt delivered before probe
> +    // leaves delivery un-armed on that path, with no handler to have re=
armed it.
> +    tree.rearm_pci_irq(GSP_SUBTREE);
> +}

The `clear_swgen0_intr` bit is interesting - note that we already do it
in `Gpu::new` (I had no idea why, now I understand! :)), so that
vestigial one can be removed (which should also simplify `falcon/gsp.rs`
a bit).

It also looks like this function could become a method of
`SubtreeVectors` that resets the tree covered by the allocation.

> +
> +/// Threaded IRQ handler for the GSP SWGEN0 event.
> +///
> +/// The top half clears the GIN leaf and reads the falcon SWGEN0 latch. =
The IRQ thread drains the
> +/// GSP-to-CPU message queue, which takes the command-queue lock.
> +#[pin_data]
> +pub(crate) struct GspInterrupt<'a> {

This type doesn't need `#[pin_data]`. Its constructor can also return
just `Self` - you will just need to wrap its call as a parameter of
`irq::ThreadedRegistration::new` into an `Ok(...)` to make it happy, but
it's simpler overall.

I'll stop here for this revision - I suppose there are more minor
things, but it will be easier to discover them with the bigger cleanups
applied.
