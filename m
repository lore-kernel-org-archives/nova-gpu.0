Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380D37BE70
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268620; cv=fail; b=Ny/OPyoI+bA/x98rYUeHIB+ELeG4qU8/m18gyf/V9irPcXplm1dzoB1I2hnZckVr1tnRCuyk2ivIBqUf0EKYh2KZOxhgZCKoceF/qAQYUhfclhyyfWTJ0n/ArRKOquZlJ3MwPWnWefRUruWdbcYO6euM6QEiTAxDXFHX+gxhGDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268620; c=relaxed/simple;
	bh=8oLgceZxndo3x9dl/L26HREqAqIZPTvTbJiOkEuQSVo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=t2FmIzJxvamn8BIZElHmfBDPmfwmEvZJOj7L3RBcgOozC1+oYCBOZxVXUfAm0TKqF/GSfa0XOTwl5uPuGTQoUVtFWA3FzRZukIx6vDp1LM67MPgyM/dI/z1jQwOJ8bho3FBovzDwqXZK7tTnISgp8Ulf/FFZLkZrOgJdV0C4atA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cwMj2F4i; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cwMj2F4i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACZsrH/10hXwyFuR26tMBOAsqXs1T/s5a2KBfHw9uv2TMB29nSHwOvZweJDbOD5mwoRUM0NpxMu/6sTzh/DNu5QzY9rIPFhGD9lNpsa/FTy7nUDos4hkUQQXdzsFIJLMar8rr6Ej8qAjnPwGV/KyvrZF7i/WGkNs6TH2/0aAGiwItq0VeJD3UR+3ePQpBZfeQo/tYmKuZcFJEh/dVRf6omA3edgJxOqZoOEj96I5TkDIaD3jo6dBeyWvcvZlNYIen9ftzB9e5510LAse3TYvHVexQBbtyXU1C1rpWKD72MHdO8k0cpDWClNngo+1wD4BQOdPukGKBGUkNxn6uCmPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQylEf7CG9bdLBTq+vu0Yu/fyUeu9M3qLG8tulbBpQY=;
 b=vKPHMorvDnSYNh9vAoSzol1EgP1GzRI+eIbSo7pQo40yp0FrLMhjzDuFmWClJC0+AJqXX3Cq+nvEK+BNCaU+bMfVTlbFs8JyK8wNsaaNuiR2L7XbbjRm3Bv4GAxYh6N0i1/edLNtBIYghelCAsXDABW0+m9hejKWtQxnPPM50RQx5nQZh/Ii9iOwe12l8TRcBLuD8+U7bEHwLaRlExepMRpCoTvjEKxObN6DTKEYjJf1Plcsta3ePeCP9B+ZOf5JQ1ZtP9X+/BuupGcFASh74hZQ1ZUp8bPcTsLMt7H02EWTzsuaxDj8qkYVNsj0YsMqV31Djut9qZ48H5FYlH7N6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQylEf7CG9bdLBTq+vu0Yu/fyUeu9M3qLG8tulbBpQY=;
 b=cwMj2F4iAPjmKJ6nfVCr+Ymz5bQWBXdDJ7dXAicqpYLxok0COzlrj9BkvLYMGNgQpqmkzLS0hRUW90W1JYyi6Z3DMaH98Caq6BVsi/dxebsZZ0vj7lJhm62v51m8p6Y9MqpGwje9c5qvePLAG8BYndd5M6Y7idJXmpBXv85dzlNWo6lilOQ5EdcReFO0OU/nZm1eRXjypwjU3ZZ06VsJmo3TiyB4puPk+MCscMMbxaw0eKmy5qSRmNDaPMtkAd+fmU837XAZ+MynpbtOF35qNlUvevdbuinW7N7jWi9w7hL9abPPPuKebGbKQf9yNlaMJF01txbr1NjRSyTjJx9qIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Tue, 1 Sep 2026 13:16:52 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 13:16:51 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 22:16:48 +0900
Message-Id: <DL40BDL39LDW.39GELW4EUE22V@nvidia.com>
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
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/15] gpu: nova-core: add the GIN vector and subtree
 newtypes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829012243.496697-5-jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6P301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd08ffb-8317-4cc6-4915-08df082b4935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|7416014|376014|10067099003|22082099003|18002099003|11063799006|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	rXijdBrnCOZ21h2euV0bA4jJrHbZLlfAV+Qb/s0E65IwAv4BJR9Rh3mU+oSexHLqvcXrgSpq8ReCKP7pmNmrVdb6QMXdEPLENn8WQZtWVsf0XbK83M5zENO8Qq4WVMU8eYNomic3aDWiEnA2YaPRu0TY23Ho5y8cBNlIRn0BAAUJtzMtAXJMeUBfWZ5UjoCx/iyp3D8XTB3Z8Jcx6RqZtgpc1xB8z5QHbCMVYE5V6BzOZiYI8Ny274VIne7s9nyBb6qDD2nSmLqBWzWj2+N60WcC2Pe5UTSqnlwkWz+QnM31RwoT3irkTLPtyZqvrz9/uavrWq+mwL5MdV0Gj3FUnx+1P5oh/gc0zKADOupDi726LhafVsqtMFNYgy9JG/booCAf4Y4eJ6IK9RsgK1TmdQ/r6vgA5g/i8bXJiEjn1fTtsBnLkq4N4x4bihXpUIsHX0fRyJKlv1Gzs4lITOX1MOi/8oXRGFgyYD/eHvscByOyYWI9C40phnmzSVlg2aV442ltWNUVOSpII0lssjU4ttCwyGLoDVdNzah1emdNPgBrpZasNn2spyvV25fDUwqQz0xyZt+n2FLMJwez9RaNtF5IFLncNjHSInzy+BHaDTiK9tU56I+vWZGT8ZlrXgfjB09DzsezzG3uI7GY7Xy3r5Kb5okLr9OXfDfZXMze5XA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(7416014)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2Q1VWVndDNQazhZQUtVWU5uQkNCbEtYVDVVV3A3bFRWajI1dFV3U2hDMGNU?=
 =?utf-8?B?b2JpK3pEV2N5c2kwMnRuUktMTGowcll3NW1laWtFckYzY0pLYlZEZ0RjS0pa?=
 =?utf-8?B?SDlnVmxCTlFtSFNrS09jbmlUaXdMd3R0aTFpYmoxRDhNcEN3UHQzOVkrdUJD?=
 =?utf-8?B?UnlIVGduQ0dBcmNrVS9KRi83bTR2YnE4NGJTeGxiQlRFMzY0Y2NZT2Fkd2pl?=
 =?utf-8?B?anhMWHR5b1pVTzRtNHVjcUdDUWJNK3BmUXJkZG9rdmloVjZRR2lRZEtBcTlN?=
 =?utf-8?B?TlRaakpNSDFSQkM3R1ZWdlVoOVQrMlp0OURpVXdnOU5tdktaaGpIVDFxUDB3?=
 =?utf-8?B?TFNSUkFLVVkwSnBPeUxzVU5LaW80WjRteHZzMkpmTkdYQjdpbHdwajRyMDdl?=
 =?utf-8?B?VFhTc1hySUlzQUorbUlQRUZXczYvZzVpMlptdE9PdndmVGhjVGtKbDNzT1l2?=
 =?utf-8?B?TnJXb0pra1RZRENuZWZaK2xjcThuUTFnTitKYkhtR001a1pKekpPWnFUUVZx?=
 =?utf-8?B?eGRLQ1NaOTJMYkQyTEJNT3hScFRYeld4YUZGT2FSekhkbFJqcHkyNDV1UXF3?=
 =?utf-8?B?NitXUWZ5NlFMOXZVZDd2WWpxb1d4WitWTERuZU9hQk5USmJUUDIvNWRnZ1hy?=
 =?utf-8?B?MURNcTUyYkdXc2pxNzhPNGZtZHJIV0Y5VThHRkEreVkrTDFQMjhlaFNYcjNi?=
 =?utf-8?B?NTk5QjlWcW55NzFKMFdKSlhGenhVMnhmUnduL2F6b3VVanlDRHhIZHYrbmk3?=
 =?utf-8?B?TGpRZ0o0VFNGbmcrcGw4TmxVU1B2ZWJZdEJRK0QzeG4vcC9ZOUJYMWFzWTJ1?=
 =?utf-8?B?WnBBbzU4R1l2eHRaWXVrQ1lJS1lvc2IzOTJFY2VQV2FzeDdLRDViT1NKZ3NL?=
 =?utf-8?B?aDdJdUJWS2tBbWkwM2x3ZzVtb3o4ZE80enk0ZlA1dXVwVlk2c3Yxa00weTV4?=
 =?utf-8?B?dG92M0hVRjFwd3FEay9HVGhsdDNkUndUdk1aM0t5eTIvTHF1UFBUdzBkcDdE?=
 =?utf-8?B?S1krQ2h2TUQ2b3dGcmVlUE54VWROYmxpYlZzemh2Mk0zanBTQ092ZG5qSytY?=
 =?utf-8?B?MGsraEo5Q0NGR1lHV0ZsRjFjRU00Ti83cmhLZ1llK21KZmFqd3IzMDVPVDUr?=
 =?utf-8?B?WjZDYXhhbXp3akNaVlV4MytBQ0VOQ1kxZHZmSnorUjZJVlc0b2tkbnViRDlt?=
 =?utf-8?B?TEx1WUp2ZkJjRnBlSnU3MVd1STZmMHpwY1FTTGdaVnloeUM2ekI4VEhESVpo?=
 =?utf-8?B?b2xyN2I3TVgvbjdSTUY4di9qOGNTLzJabWczZlZ1NkdMMnpCcVhxTUJJV2VP?=
 =?utf-8?B?MEhyOHNoNlduaEtaeGRKeWhyYjNSVnJRL0NvRG10bVhWeEs2SjJJbUFHZUpF?=
 =?utf-8?B?bnJPQVdqTXh4M1ROdEIyOCtCWXR2QTZUbFJyVEQzSi9WTnB6TTRtVWYwSW5j?=
 =?utf-8?B?VEhyQ0FMZkY3NnFGZlhyNk42ajJieW4rY2hnOW9JUCttc1AvRy9ueHV1RGdU?=
 =?utf-8?B?VE1EWllSUXNNWGNGTm5yQVJUZWh1dWtwd09zOEI1dzlRa3UwOHV6ZmpoN3FY?=
 =?utf-8?B?Y01VV1l2Q2szc2ZvOGZXbFEyN25QblZRbVh5VmVkY0QrZk5DUEpJbkE1eU5B?=
 =?utf-8?B?ZDlnOTg2ZkFrM3JJUHVhdWFObW9QSU9CdnNoQS9UMnRYNXRqMHg5eFVlNWJ2?=
 =?utf-8?B?UEhyRjhjWFBsN0szNnVwOW52WTUwY1NiT3Nwd2ZnQ1MzUFFuVVB3R2VXRnp1?=
 =?utf-8?B?cVY4YkFsVDUrWDFSc3hMTnBJRkdHM1gralFqbDFpeFZpUkNYT1kzbmpPenZC?=
 =?utf-8?B?cEk4Nk8rbExFOGIrdHlnZFpwdlhlRTNWTFo3eEEyQ2ZCWnFYWFhsMzJOdmJw?=
 =?utf-8?B?cld3V2ZRQjJkdWNkd2pmV1ZwNHB0RDgyQlFxMDhaOFdpMXJSdWtTMGNhYmtH?=
 =?utf-8?B?dWJuMmVmbzVrKzhFekZSc29TMVE1MlpiRTU0N3h4a1UwOUlEaUFhUXZRdVRt?=
 =?utf-8?B?VmVLVXkwaDhMZk1kVUpVMUc0MFlsdjJ0ZXdEVmtOZHBXMGZlMytVdURPMGFv?=
 =?utf-8?B?T0hhTHYrWDFvMnRMU25obTZJc1JOMGptWTN4OVNSRCt2VTdpOFk0b3hGcHg4?=
 =?utf-8?B?SVNlUU1JRnZzUm8ydThOOVZwRE5rSHZEVms1Q1NPajRvMytWWVRrUmdjVzEx?=
 =?utf-8?B?cG5aVmMvdzNFYTRaTHZHMDRxeWh4S3NaSXBhQTFaTkFSd25NWGhPUGl3V3I2?=
 =?utf-8?B?ZG9Md21nNjhidVhEeEp2emVBNWExdnVDa2RKUGFaRCszYUVIeTNMZVIvQWNt?=
 =?utf-8?B?VXFaTEs4TVpybHFyUk0rZnRjRCtvTVQyeHFta3cwNkQ5anNJb2hpeHptOU1M?=
 =?utf-8?Q?SZmeP3msvnM0HuwdWL/lWrSLab4KkqthhrjN0t2tufaJy?=
X-MS-Exchange-AntiSpam-MessageData-1: RXHnOIlY0bcMrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd08ffb-8317-4cc6-4915-08df082b4935
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 13:16:51.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RH233K8V3csFH5QNVzv0hPdYokeF6tYnzImrRDFn8JV/IaMe1rrFzoW+jmF7BM19tRDX9H/AgOgK0BV2gVEf/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886

On Sat Aug 29, 2026 at 10:22 AM JST, John Hubbard wrote:
<...>
> +impl GinVector {
> +    /// Returns the vector numbered `VECTOR`.
> +    ///
> +    /// Fails at build time if `VECTOR` lies outside the widest tree any=
 supported part
> +    /// implements.
> +    pub(super) const fn new<const VECTOR: u32>() -> Self {
> +        build_assert!(VECTOR < LeafCount::Sixteen.vector_count());
> +
> +        // INVARIANT: `VECTOR` is within the widest supported tree.
> +        Self(VECTOR)
> +    }
> +
> +    /// Returns the vector number.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Returns the leaf that carries this vector.
> +    pub(super) fn leaf_index(self) -> LeafIndex {
> +        // By the type invariant the quotient is already below 16, so th=
e mask changes nothing. It
> +        // is what proves the bound to `from_expr`.
> +        LeafIndex::from_expr(crate::num::u32_as_usize(self.0 / VECTORS_P=
ER_LEAF) & LEAF_INDEX_MASK)

Noticed this while reviewing patch 7.

Another nice side effect of making `GinVector` a `Bounded<u32, 9>` is
that you can now get rid of this `from_expr` (which relies on the
optimizer-dependent `build_assert!` under the hood) by doing
`self.0.shr::<5, 4>()` (i.e. divide by 32, aka. VECTORS_PER_LEAF) and
now you have... A `Bounded<u32, 4>` that fits perfectly into a
`LeafIndex`!

This method then becomes:

    pub(super) fn leaf_index(self) -> LeafIndex {
        // CALC: `self.0 / VECTORS_PER_LEAF`.
        self.0.shr::<{ VECTORS_PER_LEAF.ilog2() }, _>().cast()
    }

`LEAF_INDEX_MASK` is now unused and can be removed.
