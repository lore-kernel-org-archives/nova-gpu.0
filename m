Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF7387563
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388915; cv=fail; b=ixWJTUiTyybbAfJvUTbfgudI63esxVbDp+FCtJ7bEqsvmCBZ631ve2Q2UkYToNzH0Sg2iqseEU66/fpESKAIG8It3LrzfqLKve2BAVqx1w1ILP+urrZh+ez8I5NRf11A2nWU+VZMKfDygN++g6hCQ7fdh427FIc+zPEbA88q25E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388915; c=relaxed/simple;
	bh=FArOX/rGwUnvuZcoNYM1WuVvUpIu3tKuOI4/7JFRsUs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CAqm2YtPiJEJsMsWJcWCSaEiuLEyI93XiPNt05tA0OVv5If0wo4+NIEmG/KIPtm1QUqiTmUE/MOLBOpDpn9Lhz2U7wLfaAK1eca2l8tBZylegWnSpmFotok+Vk954r8H83cdJWD7+PPgoOOTXMrKSbyYT1o6MHGQedolNOtdt8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b7MxsGqQ; arc=fail smtp.client-ip=40.107.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b7MxsGqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EF0g4yUS8yMxaVblDSMTel0txUaZ4iNIyHuGCBlXy8LVECpVe+BxBTzRKnhEMqdj/Fs/zZXE+yzICj5knl5N4SUbAjWj1bfeIauq9kA+eV/KpHjeNwriY3MiXSZSLvEGbtbXLDO4k2XbQcWl+u7eT8h0ODhy7fyrPbxD9Aotu66qeF1w+NP6NjQ7j8nLtRtw1rTNd71jy/bZu6+sqrkElRD0NnHovpPi3yF7I3Ev6PmpCEcdeaCZPN1zmdYIUTKn4jwG9N7dG6b+hORq6PMKBRDVbsEaamE7ivV877UHO1gQN+KNQGbxG0OYE/rQuxHcMmwfJ5kqvdjsMv1a/XCB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYWPp2eq+vB3ELlzP3N/Ymdqox3rIQltaF64NzMPIZQ=;
 b=dUjp1DNFYp9uWyOgV+o2aF2Ay/R+CseWjynwHslULWXXftax6iM9J3ioflE3cqS+i9x8H4L3D+WaOPEz1WUC9jVBe7eMWEtGjxfYZV603rqLAfOM0K5MEUC7dtCMfURC55dd8yL/fzY81xkYgUwSRAXiseTTrGvF166k73ywk2XeYNaYtjSLPLa9xYosCILFJn1Pktm7Q/HQy2HFcuE8b58GJ+IzlAbArJt0TuzlS7C8hNocCobdayydd306K1BwzlYhav/tzmb2S3lI7GMJQokMyc+4imHIET7ZAW5lkIOZHifg9Jh0U3O6HAFqfN/OxTJougwTClXRsc8bHorlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYWPp2eq+vB3ELlzP3N/Ymdqox3rIQltaF64NzMPIZQ=;
 b=b7MxsGqQ1xrWmA3EFeOLfhDYXSE58O+4BQq6jEpTkwtResHozkW7Dt8iCaIln+1oyGtvWsfG9tJPkk8h3vupDJv/VHy6kMmECTE2NtfGsydHQYj0hEEkdOSnUUzV1JgnyvMYPSylHgE5J2JLDswHLH8IR+2cj38wzsXP0v0eLyIbI3PDCUMx7CVqaOJzyvYV2kO+McHt4ceKZPdSqas0itg1dBR29wnbCGXlPl4spXjB+zfEc/j0JqfTOSSTQ7t3/Zm+aJ1xS9gJ+JvY9GRqUUMq1U+HWF2+FqDCKw1L7Ijgp/8ozkx5bY6XKL+rrthEla2YOJAcyarYHmB23X6PNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 08:28:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:28:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:28:23 +0900
Message-Id: <DIYF6Z3U8RU9.1LIR9LNYCG5LV@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-14-jhubbard@nvidia.com>
 <DIYEU5PHRGGB.3Q4G9ZMCITCFT@nvidia.com>
In-Reply-To: <DIYEU5PHRGGB.3Q4G9ZMCITCFT@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: f12cf51b-082c-4406-2058-08dec080eb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|11063799006|18002099003|22082099003|4143699003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	At5IDtDujK7mPB/8sZgqU4n58ul2/OFnHnqYDzi/HcKdhg1VQsRYeqZR6j/HqdmypexbJoYq4WS1xG34hgWrOVuhHByW61ig0ipIhD6xqOt2pOUJmuToLWKgCML+X54VTV0VWG7Pay80Gdbg497M66mdXkoxbzHc0QcYMBLOzYXRiTlkw2YMEpBmpLQYnC+Pr8HNlC7Dm0gKqPC/RR55TTqh3R41l0cXgTrX4ZjuAhvuqXRlhBeBG0C9BxWW9fPro3wZ6xG0AGw1807FqbwhPQbpocqrLBGHzmNpWOw2vphMiEb0KIHMdKPu//vAO5FniXnfzKCrRVgZSP5Cu8RgjCmflU+OSBsnkmqDGKOy2le7fakyoPjK0KEujwINxoa3bieOKDpdAkJbfYGf+rHHhy/pWdkNcxNvF2Qeu0DWG5r2Rv/hFBPSf1/gXR/nzA5JxpZpQ7jiccu/Mx37/ePYQQVuFvdbZu5+rLWBrv8Zp8eoOf80R6WzCqqv+XU5pFgeJsdyQaijnP0YXi1ijKG5+sEw6NxhWk3zyCwMx7RJgu6fhjCdbxk63bslMlINsB0MW8+3lp3b8LNMLBiLOpwlf3kK43MXlLF4sr3nXDKlw2bZiyhIT3PaIZ9hPT+p1/Zw8n5ILPXWWXER7mad+MKSR1x9Og4U1BwIo2UHqvpAg2dADD2yyxP8etDcnfTgMORgZxm00oV+R8Kk1e1j4+PhCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(11063799006)(18002099003)(22082099003)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDRkamhIRXdlNEpZT3RDZjJFRXl5RXk2amNuKzJLaDJnbzhaK0o0Z0RCS1pC?=
 =?utf-8?B?NmRUNjk1d3cxWXAxdjluQmRydXB6RG9lY1BmVFdtK3NRN1E3bW9FNTA4UkNX?=
 =?utf-8?B?SkFIb3kxTzZXdVJYR1R2SDJleEp3WVlScHNBZENXTVltVTJMbkUxbXRMMERv?=
 =?utf-8?B?ZFZPb3ZqRTlTTTFUbENJQlNOa0FVRjlkSGltdVp5cEVBMXJ0bi9YcExwMnpH?=
 =?utf-8?B?Qko3QnRhUGl2enN1OER3ZEZPSE9idnpaaEFRd3E5OGw4eTR0b3FIbGhtZXlj?=
 =?utf-8?B?N3J5Uk4xMGhsM1BLYWk5Tjgyd1BVS0FHcVAwa21aaEQzTkhsQkZNdDB1YmNF?=
 =?utf-8?B?a3AyMVNMNmFPYnJKdWtkN09NaXRKRTdObTlhOW9Xa1ZPTXpSb29BcURBUFVN?=
 =?utf-8?B?WjVSTDJYZXNMeXJidnh3M3VYY1dSeFN5d3p3alFoeUNFdHJZQmtTbHJYUHY0?=
 =?utf-8?B?WkVKT2ZJMDFJUmZRMndCU0tlYzdpWHlaMVZVZU5mY1VWZnA3ZGt4ZHA3OWhR?=
 =?utf-8?B?SWRBdEk4MEd5czM1VHJyS2FvMTJYeVhFNkRaY2tUSjUwUFMwcGpqa2hIdXRS?=
 =?utf-8?B?S0s3MTQ0bzFOSXRVUlU2NjZvZTFaaTRlOFBRdWExd1RRZ3l1cVg4ckhPUFVs?=
 =?utf-8?B?Um1DazhYV1VHUlByOW1zSFBjNXUwM3EvMi8ybG9HZ3ZES082Qzg0cVhzTUQv?=
 =?utf-8?B?cXFyenFQSkJVTzZnSG9zS0ZZaGMzWnFMU1E1SFpmR3VWTFFYZU9wakxQaktq?=
 =?utf-8?B?NUxIK2o5VUV0VDVVeU42SDJaUGkvekJ3cmNJNXZmWWNKLzV3SG5WalVHMkp6?=
 =?utf-8?B?M2dSdjAzeHlVMFRySEJZbTkvL3JmVEE2dGlrTDN5cm43ZUlwWGlnbnRXSysw?=
 =?utf-8?B?WlAzTVlsVFptZko4N3hEQzA3cWRxdFJEVDJGaDFSR2pxb0pNaUJUYytMMUpx?=
 =?utf-8?B?a0xlZXlnMjFBWCthUktBTnZYV2VpWkhQMlBxdjlCM21kaVdRUVduS0YwREli?=
 =?utf-8?B?M2Y1S2JheGZJOHFJNGorQ1RFQXRVTmRpNzN0dTRiZGVpTjZUcGlFdG0zZHRl?=
 =?utf-8?B?V1V3bnVPbjdxZXlWWVZONDJacjAvWjRnMkJ2NUNSd0gyQ1BmTmlFZjlacDc2?=
 =?utf-8?B?NTJuUlEyLzJEMlNWY3p2WUxNc0pkUHNMcWpTdEJNS0pZNlZNOTBpOGNwdG1N?=
 =?utf-8?B?REdhWWtnU0dKU0o1SWlLSWI1V3VVZjQxWW9PSC9sVW9VZVJmTWZQNUtKK0Jy?=
 =?utf-8?B?S3VZYnIyc3grU1dNaGJQaGRISGk2cVhuYW9LQ2J3cGprZ1dvcSs0VVUrK2JY?=
 =?utf-8?B?SGpIQmlqOGlRaU9wUkVyM3pYNThVZit3ZWJYNDIrdE9KTzJ4WDRuZUZKL09H?=
 =?utf-8?B?eTl4L2tYWkdnTExJbTZkMGZCWlk2NHpQRENNam5Ub3dJaDZRL1piNE1KZXlU?=
 =?utf-8?B?U3lid3Z0ajVvdXNNdU1jZ1ZUSjFwVTJOR2dOZDRMRExZWllvZGt6dU4vMDNp?=
 =?utf-8?B?d253MFQ5Vjl0ckEza0kwR0pJVjFmN0UvZFJjcjI0RThNQTBJM0l5bVBJRnhB?=
 =?utf-8?B?cnYxZGk2MUt2Y1RaU3Bzd0RmTnJWblJ4NHdzeWRLWDZEZmlsZWE3eHlsUGhY?=
 =?utf-8?B?MzdPMDRYRTk5dDhibHRQUlVwK2pycHRaVDVsMDY0dGR5YlgvaDdFUXRFcnpN?=
 =?utf-8?B?Mi9ISnRIank1bDN6dGdISllXNENpQkQ0QWdkSTdjSlF1SFBIeFROalRJTGh5?=
 =?utf-8?B?dnFpc1cxMnhmZVdTSXMwOUs4NlRmcE45R0FKRFhJSVNQSEQwb2VvSkd6Nnd5?=
 =?utf-8?B?M2VsMlVBMlVqTW9DTGNjSzVremg4ZFpQZ013UC9uMGZqZFBMTEU1OXhzTXFT?=
 =?utf-8?B?Z21URDAzaDVwNGJYaWExY1lNZUE4b1JkZGxSeHovKzZmQ3JCYnd3aFRRR3hD?=
 =?utf-8?B?M1lqQjJQOWh3OU1qbmcvcW5QMG42UGhNdXBHQVQyYVpnZVBHY1NIZ05EL1pr?=
 =?utf-8?B?cUNlR1dnWE83K0xKdVZaUW8rN21nMkY4TW9hYXJjQ0ZnWkZ1cFc2Mkx3eVQx?=
 =?utf-8?B?VDhDbnVKdmtsZG1sTm1obUpMRHRHK1lwWWxvS2lEL0ptdVA5UDFBUlc5SjBy?=
 =?utf-8?B?SFJ3YmF2YklZT1lKeEFubW91S01sU0w0aEgyVHgvRk91UVAxZGY1a21GSGh4?=
 =?utf-8?B?Q1BtaUpFZFVKKzdLb2ViN1ZydWRGUWdHTmN6RkdiQ0cyQW1Nb21BazRzQjg1?=
 =?utf-8?B?bXZsRHhPeWZOWkJheTZ4UHNFR0JoWTVGZVNxWWhwV1R1MGp0WkIrL0hLQU9M?=
 =?utf-8?B?WlAyd2RDWXIrL0lMSUNiNEJjSTMrNC9ZNTRjc3h0blAwSGErMHZJUnI1Tlla?=
 =?utf-8?Q?+6Jg6IN/4/NcU2ear101mSBGc5niorYuDI383cdcM5uNE?=
X-MS-Exchange-AntiSpam-MessageData-1: RC9kqUJRmnwXww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12cf51b-082c-4406-2058-08dec080eb95
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:28:28.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss2YN0KpP1RIdH0z1hTkKgUWB9zo3P9YHNXnivMT1pH3ttAmEPbsFkom55eaMh/WYLJ2EQg7EP5nehygvqCJKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

On Tue Jun 2, 2026 at 5:11 PM JST, Eliot Courtney wrote:
> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>> Extract the SHA-384 hash, RSA public key, and RSA signature from the
>> FMC ELF32 firmware sections. FSP Chain of Trust verification needs
>> these to validate the FMC image during boot.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/fsp.rs | 94 ++++++++++++++++++++++++++-
>>  1 file changed, 91 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-co=
re/firmware/fsp.rs
>> index 011be1e571c2..db61905eac9d 100644
>> --- a/drivers/gpu/nova-core/firmware/fsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>> @@ -15,13 +15,35 @@
>>      gpu::Chipset, //
>>  };
>> =20
>> +/// Size of the FSP SHA-384 hash, in bytes.
>> +const FSP_HASH_SIZE: usize =3D 48;
>> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `publickey` section may be shorter, so the remaining by=
tes are zero-padded.
>> +const FSP_PKEY_SIZE: usize =3D 384;
>> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `signature` section may be shorter, so the remaining by=
tes are zero-padded.
>> +const FSP_SIG_SIZE: usize =3D 384;
>> +
>> +/// Structure to hold FMC signatures.
>> +///
>> +/// C representation is used because this type is used for communicatio=
n with the FSP.
>> +#[derive(Debug, Clone, Copy)]
>> +#[repr(C)]
>> +pub(crate) struct FmcSignatures {
>> +    pub(crate) hash384: [u8; FSP_HASH_SIZE],
>> +    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
>> +    pub(crate) signature: [u8; FSP_SIG_SIZE],
>> +}
>> +
>>  pub(crate) struct FspFirmware {
>>      /// FMC firmware image data (only the "image" ELF section).
>>      #[expect(dead_code)]
>>      pub(crate) fmc_image: Coherent<[u8]>,
>> -    /// Full FMC ELF for signature extraction.
>> +    /// FMC firmware signatures.
>>      #[expect(dead_code)]
>> -    pub(crate) fmc_elf: Firmware,
>> +    pub(crate) fmc_sigs: KBox<FmcSignatures>,
>>  }
>> =20
>>  impl FspFirmware {
>> @@ -41,7 +63,73 @@ pub(crate) fn new(
>> =20
>>          Ok(Self {
>>              fmc_image,
>> -            fmc_elf: fw,
>> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>>          })
>>      }
>> +
>> +    /// Extract FMC firmware signatures for Chain of Trust verification=
.
>> +    ///
>> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware =
sections.
>> +    /// Returns signatures in a heap-allocated structure to prevent sta=
ck overflow.
>> +    fn extract_fmc_signatures(
>> +        fmc_fw: &Firmware,
>> +        dev: &device::Device,
>> +    ) -> Result<KBox<FmcSignatures>> {
>> +        let get_section =3D |name: &str, max_len: usize| {
>> +            elf::elf_section(fmc_fw.data(), name)
>> +                .ok_or(EINVAL)
>> +                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{=
}' section\n", name))
>> +                .and_then(|section| {
>> +                    if section.len() > max_len {
>> +                        dev_err!(
>> +                            dev,
>> +                            "FMC {} section size {} > maximum {}\n",
>> +                            name,
>> +                            section.len(),
>> +                            max_len
>> +                        );
>> +                        Err(EINVAL)
>> +                    } else {
>> +                        Ok(section)
>> +                    }
>> +                })
>> +        };
>> +
>> +        let hash_section =3D get_section("hash", FSP_HASH_SIZE)?;
>> +        let pkey_section =3D get_section("publickey", FSP_PKEY_SIZE)?;
>> +        let sig_section =3D get_section("signature", FSP_SIG_SIZE)?;
>> +
>> +        // The hash section is a SHA-384 output: it must be exactly FSP=
_HASH_SIZE bytes.
>> +        if hash_section.len() !=3D FSP_HASH_SIZE {
>> +            dev_err!(
>> +                dev,
>> +                "FMC hash section size {} !=3D expected {}\n",
>> +                hash_section.len(),
>> +                FSP_HASH_SIZE
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Initialize the signatures in place to avoid building the lar=
ge `FmcSignatures` on the
>> +        // stack, then fill each section from the firmware.
>> +        let signatures =3D KBox::init(
>> +            init!(FmcSignatures {
>> +                hash384: [0; _],
>> +                public_key: [0; _],
>> +                signature: [0; _],
>> +            })
>
> This proc macro will generate some code like let field =3D [0; _]; which
> it then writes into the final init location, so it's stack-ish storage
> although I guess it'll be optimised out.
>
> optional nit: may be better to derive Zeroable and use ..Zeroable::init_z=
eroed()
> here.
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Yup, this was also picked up by Sashiko. I ended up doing exactly what
you suggested [1].

[1] https://lore.kernel.org/all/DIYEINL9REVG.3484XPOLDZ0KJ@nvidia.com/
