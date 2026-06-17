Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5215E5BB
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697775; cv=fail; b=RzUtOMDCEKMeKGotSq3KiXXnL+6XQCS+rNvAiMzp3rSbyl6SKWYvkOCX/xx2hZF6GQuomkw5DNrBBu8FDqE0WCn9hR2PoLFqPswjjbHKH9EfqYXmqISu81MG31TvKKNvhFX9SmpXwG+0RoYxiK8/x4gK7pd3ApWmwiNS1VKD65o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697775; c=relaxed/simple;
	bh=LooE9mcUaNQknSVojTEgwoHme3GcOHVPP5bjCRL3gLs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=bT1I9lksSpFTTILc23xZQYvy4quFrsJR6neENAqwFq8rSy2DtMSyBZ8VWx9iJGp3BoHYbu8BtzL2CrtPhKGDfx36H4zCzRiG6ffj3VbLkDXNQxnQKiHyXmaXnEiTuj5NUC+qOKn4wclNkUDsgrXa7pu1n25qPH0MpqQDOlVz538=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dE8BTmkn; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dE8BTmkn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZvOe2d4Tw8+EouiGhIPL8nYABebdJGDVNvdUBlDpbWfX04GQCt0V9iExD5VryyhWI+DilqdlnGzJCREXXvGQBS7KvNrySun3IVwZg1CNYZR5Lw29NDl7ozpRcmpz9rIaxp3vVxuwkNlDvrlMzYVebX+U2bAWqsyWiZHtACaSarp6+Nem5YtvYrKgrO2XMiDgNWc8neH1oRmGap4Q86kKA8rMAVCykXebtYp+4B6EDTPHozskFNQJbdiqOo1VaUlHwQ8BL+UeA5R3I3c+krL4PGNodT1g7ASgIWmu3RxNKHhV4VccHaSULcz5blSbCLajYYwHLBNGQKCpJpzeuIkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrJvbXSy87/PO51W6gUIrYWL5KYtqNhQ9/YO2W5ScKU=;
 b=muelM16OpYT2JVAZ7viit4O00tkJOBToWVtBo6zPMuEeAneHmMS1nCYZ14qQl0lM7SYC0XaFNIMnaD8eP5hFghwV3Dcn/tXxN09DlNMrz8HPp6gStAB5GjIjWgZGgV+OYcWaM6sqgwBJnNKMsLWO2hX4zT2b7kZ6RajPvB++ScKkEVO4PCi9SyOyPZMxHkFANimSHLl/NoBwR4bG40Nb0dB6vIQJjh/0qg1tJw+MDnzrfwGOuth2aH0lyGVfHJNHlZrf194Cnnn8RI469ki/ztr4+yqxlX6vnhlnm6gYrgaIRqVVvHh8luYnYasiUEAk6SUdsbRGwFOstF9YmuD7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrJvbXSy87/PO51W6gUIrYWL5KYtqNhQ9/YO2W5ScKU=;
 b=dE8BTmknE+KKPX1I5rWmTDT/n+e5WA3t/IMWXjWWxGGEgXTvMqTltN7801PztLYxgbXEfurU0i0VGyarqfYA5YN1b4ydbk3qccreIGhSDFY8cAr1nkQPQLnJTeWTRgpIdFtOnr2o5Ut9aZe28CS06SdOF/AgMx/AunJk+tZWfaIEeESGyNDm3wenhNDjPqLZcGdsnb8sAi7Mh5S9jL+VXC+r5D8AEnZnQiVQqUTe/Scis25B7dyMrHdDQqPn6GuhOdY+I8XQNx+Weo+zyP/G4x5YYuDbeYkQ6gRsNpkUaI1ndKBBwc4WqhT/eILhyFeg07SD0OoFOszRb2GvKLcRjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 12:02:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 12:02:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 21:02:44 +0900
Message-Id: <DJBB59BVA98W.3GX2FB12NCI1L@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: reserve a larger GSP WPR2 heap when
 vGPU is enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-10-zhiw@nvidia.com>
 <DJAJGC4LLOK3.YAX75103O00O@nvidia.com> <20260617110719.7736f80c@inno-dell>
In-Reply-To: <20260617110719.7736f80c@inno-dell>
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6b93a3-f48f-4d78-f175-08decc685910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|4143699003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	8CyclWF0qzh3sx0RI6HEv6y0VTjObzzUu964zM6R3xxAhu3x6dtNGWK83lrdIZTOiDSGC+KtAQ6qu8Fxo35o7aMe9XSwN0PT6cTIAtM1TOyJKbBUXrjBKyMiAhFYtSJnkN/OXi0rel3y6671hfBDTpmL+ufBtRCSWBVu7r/OMQKRRZOsCBRaa+OP3hhWqA9MYw2KusiANYWt0hKn+hXgbmz9F6M/WF6MXaFbT5RAjOeK+wLrdGAbPd09IQJI2C1XLppf6hD0NlDX6LtxToDttL9Vej0JUjg1/5WWgVu2M4Y9k8+A+c9VZEKWtJc9booKrYtytsmzDS9nTC4ZqoOSOYkX4mpiAdA7eCOV4TYrQElLS6FOgr+RDKUvBbgFic/3DOrr+HBQLdAfeVQ8afIu2mtlebhXK3tHI68ON7BPmBIBIq5p2Pw54lmIKB91JLp+1M6XWoZYzg3m1lRz9eIKjrzcfBjaR7AZREVWcsZZyn9djsMzb1WInzqNSo4Yh5kaeWfpL83uASbQZDYSxlNTILKqhZWRRQJnGqZ3QuRnhucIIHtH0ZGvg/gk2AK0q5NcMO5/5o5lHS8JiKytjvbtxoWF/dftEPy3CrfoXgWULflZzwwcyrNoPRi1hkLVrJpChlYKa3ucYI8hZAc3SE0JearOyr+2dd5DtT5x3aVHK4TWSRbGjWD4ELN8RTBNe9ZowuVDZRF02L51k8GoHbcE8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGtPcXQ5cDZzejE0blEzeWIwMHBJK2lSKzJOQXl1L3g1c05uenhMMXIyK3Z4?=
 =?utf-8?B?N295QWZ4M2k5VUVtSmxKTGhTWGlxaEJ0dDUwUllOdS9EYlZKNnhqenBDOHNy?=
 =?utf-8?B?bWZkcUt2bzlrOVFGNEhib05YTThnRlE3am51dHE1V0JieFRTaWFlVktnM0gv?=
 =?utf-8?B?WGx2dGZLRFZ2RGxuQk9XVWNjYWJ1NVJVclZydnNoVDcwK0hLTm9PRHhZS2px?=
 =?utf-8?B?NmErSGJzVmI2VkZHcGtpK3hpV0RRL3V1eWVxTGhUZFRWd3VFaHprOXpYZ01k?=
 =?utf-8?B?U0h2MkxQeDJXaktJVUkyVVpIUDZ5RUZ4VEtTMEhRR2NObUVMRm4yb0JlUWM2?=
 =?utf-8?B?cjFuQWsyeThNVm1BeXBGMlBDbHo4bkRUNzdUTkZOdjU4RjZzbHdhUHVYS2dL?=
 =?utf-8?B?OW02N0ZSdHlBWlhBZlhIYWtqRHFDUHVJaFIrTzJncm5ZbW9JOEhhWC8xSDBs?=
 =?utf-8?B?VDIzOUxVVmJRK2wrWXpBOW1wNGdmbGphS3ppTjFVVDVmOHNzNjZ5cWEyVE01?=
 =?utf-8?B?TTIzdHlKQkVCZ0hua09YWmdpWThIR1NIc1YvYTdaVU0rREs1WFBGRUNRMytp?=
 =?utf-8?B?MDJ2Vk0renQxUG1JUFR5RmpIbUFBWkpFVEF4TmpvNlFJcjBZdU5La0Fsc1FX?=
 =?utf-8?B?anlVZTYxdVp2blQxeTc2cmJJT1hVNkJMOHpTaFVFdUdaN0xGNTJBSkIySTA1?=
 =?utf-8?B?MFdiOW8wZHloK3BaOEg4T01ISVBaZU9qcGk5NUQ5TkJLMVhhMkV6TUxaOTdR?=
 =?utf-8?B?VnhRdkNvYmxoTC8rY3lyQ25EekFMZkpxVnR1UGMwN2U1MFYxM3lVWiszMnZs?=
 =?utf-8?B?OFA1aVgrN1JQczk4ZWs3R2RGZ1BtaVhNQWppOEpyZFVrN0NMa0xoQnF0c3E0?=
 =?utf-8?B?Wi9qUHlYT3BXMklpczNiUGxsRXIxR2ZoK2JwRWhKbW9hRmJobHBLNDEyWGdV?=
 =?utf-8?B?a3IyaVhlSlhIZm1wNE81MkVtNUFuT0hBcFRkY1BDMDA5UHVCWmJURDA4U0JI?=
 =?utf-8?B?bGFBWUVyc2luNHFnSzR1R3ZsMTl6bjYrRHdjUEZuR2NnM1Z5VEpWK3RaRzRR?=
 =?utf-8?B?YmZyOVM5VUhpSkxBOWlINmF3U0x1R2VkNzlZZnRFY09TRTZxOWYrNC9XU0NO?=
 =?utf-8?B?aUZwRFIzU3d2OHZtYWdNSWFaVHJndUgweC9ZbmVDVnAzNkVKUU1INXB1eWV2?=
 =?utf-8?B?bGNpU2p0dEJYSnJVR0wrS1ZDd1RuSUFkTU5Odm4wTE1STko3OFlXVkxpc3dh?=
 =?utf-8?B?NGxVSnpwSzhpaUhvZG4zN292cHd6OWJJUkgyQTFCL3JQTnc1ZUFqak85bnQ0?=
 =?utf-8?B?cTNQTmRJYWNkT0swaTczNk8yR3MxVWlOSnpZdEZwUDcycmNaSVNBK2RSQXhn?=
 =?utf-8?B?VzFxcW0yVkFHT2pGTm51RzJoZG1ydEQ0a0ZwaldkeW93SU4xSU1pUzA2YU95?=
 =?utf-8?B?Y2kwK3VramRDRkszUHlVMEl3M0hRTnM0N2dVbE9iWVNZNlRiQjVQc1hvcnVy?=
 =?utf-8?B?aFJodEtmRWtIL2JkVFlucDhPUTVobmI2Q1ZrVlh3dk5EdWczTFY2U3gxNnJU?=
 =?utf-8?B?Y3MvSWswbVBZSE1WdHZOQnEvcDVwbUx4Nmk1eDVUNHNSMGp4azh2ZURvSGov?=
 =?utf-8?B?MTk2SnZqM25QbU5ubysvK0FWeW8vQk1zTW8zdGxjK1ZBOUdvdEFQRnRGVDlE?=
 =?utf-8?B?dTFNQXhvK0dyc3ZZbDk4U1A1QU5zN3V4bFdlQzF3M2dOVkdoTFZtcFhJbjBK?=
 =?utf-8?B?VFlCWHJDR1ZodDY4Z05HU0wydDZ1cCtrN091OGVoaHBRMmZyeHRLUVh1L1Bq?=
 =?utf-8?B?Ung0eklLNFA4S3hJczhqMHpzTGFMdkNVMTMwaC9mNFdjQ2pSWXpwV0NtYUVk?=
 =?utf-8?B?a24rNlhYcGh2Rm1ybHBXMjUyV1NmTUk3eGE5L0VUZUx4dUJNQkdhdEhuTmI4?=
 =?utf-8?B?bGdsYW9FV3VwVlRVQ0hhRVYwbW9JQnhKUFpVbFo2YXBCbTJpUHNSYnViQ2c4?=
 =?utf-8?B?TU1CYkxOUEF5WW51R21vL0kwdERBTmNxelFjQ0lJRnlaNDhlT0IzSk9Iaksr?=
 =?utf-8?B?SUFSdTA5eW84SmxNTytqY2h6K1gvVkJaUGRlb0hSWVJvWU4xS2w1MTRjQXNQ?=
 =?utf-8?B?Ry84L3FyMXZpWGNpRHFHbitWVjRuNHlpRHBoeXNvK2Ntc1JIUG8za1I0UENV?=
 =?utf-8?B?UXFlb2M5ZHM0eWtRTlM0c3h2bFlUdUF6eW10TDBuOEswdzZyblc2ZkZ1Wjh3?=
 =?utf-8?B?cXFEeHM4SW0yVVVJK3VSMmlNcEZBeTZBTmdIMW53Nmh3TUFEeGFISStVeUti?=
 =?utf-8?B?VHZRbmZTSXp1bmEwbVQvWmxIWjk5b2o2SmdqUDBEZTA5eW5UZ2Vya09pUjJS?=
 =?utf-8?Q?7ypBE7cXcyO5EUpAmYXpIcLPzq+X/QNLluC6zgJM3+2IS?=
X-MS-Exchange-AntiSpam-MessageData-1: w/vf6fH+XsvU4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6b93a3-f48f-4d78-f175-08decc685910
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:02:47.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9IVHCc13aiTAmlgbigHudMMO5Wj8Ujq20TrR75EdV0jWyfLu6I2YfTG84UqkSLC53WTRGqTa7ub6DZgqW8jUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

On Wed Jun 17, 2026 at 5:07 PM JST, Zhi Wang wrote:
> On Tue, 16 Jun 2026 23:20:41 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>
>> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
>
> snip
>
>>=20
>> `total_vfs` is only meaningful if `vgpu_requested` is true. So these
>> two parameters would be better modeled using an `Option`, or maybe
>> even better a dedicated parameter type for vGPU settings? Something
>> like (please pick a better name if any):
>>=20
>>     enum VgpuRequest {
>>         Disabled,
>>         Requested {
>>             total_vfs: u16,
>>         }
>>     }
>>=20
>
> Make sense. Let me try.=20

Actually, please check my later reply to this patch [1]. We should be
able to completely get rid of this if we move the `Fsp` into `Gpu` as
described in [2].

[1] https://lore.kernel.org/all/DJAZT6ZNLZYZ.OJE0UIR4OOBQ@nvidia.com/
[2] https://lore.kernel.org/all/DJAZRULU1QHZ.2NSTR1ZPOQUSN@nvidia.com/

>
>> > +    ) -> Result<Self> {
>
> snip
>
>> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs
>> > b/drivers/gpu/nova-core/gsp/fw.rs index 14424a2c2d83..2f3cbc5d5114
>> > 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
>> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> > @@ -101,6 +101,18 @@ pub(in crate::gsp) fn
>> > advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
>> > pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D
>> > num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);=20
>> > +const GSP_FW_HEAP_SIZE_VGPU_1VM: u64 =3D 174 * u64::SZ_1M;
>> > +const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 =3D 581 * u64::SZ_1M;
>> > +const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 =3D 1370 * u64::SZ_1M; =20
>>=20
>> Do we have a source of truth for these values? I can see definitions
>> for `GSP_FW_HEAP_SIZE_VGPU_DEFAULT` and `GSP_FW_HEAP_SIZE_VGPU_48VMS`
>> in OpenRM (meaning we could generate bindings for them), but cannot
>> find a reference for `GSP_FW_HEAP_SIZE_VGPU_1VM`...
>
> I see. Let me remove this one and we can add this when OpenRM has it.

I am fine with keeping it if it is useful, but would like to know how
its value was inferred. :)

And also, how stable these values are, since they will need to remain
stable across firmware releases. If they turn out to be
firmware-dependent, maybe we can turn them into TLV properties of the
firmware.
