Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7130C17D;
	Wed,  3 Jun 2026 01:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449299; cv=fail; b=Abp4lcK4qHGCtHSSqqEo749lU/nZqrtk070H1aJD1YBboktLysS24gCASh4F8qqFrW1PTD6g8q2mCEb998loeqtbMobSnSTdPJiJbWc6KG38gUZC0R2aN6uBdwCsSDg8V+SIjtpzRltemEJKa05V6/Lxqwzy72ykyPOHsZbzZkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449299; c=relaxed/simple;
	bh=AtZBcJPo4XP+iMX8jtYXO1L6YHt5ZqFUS2aUlSdpqkw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=MX8ptHgSlsS4QHIpBsGL1BK94eomN2yphG0P7IO24Q8aE6ZPQBm0txpmSfc3qS0NynIZ7pQ/W44uHZUqsAmXZzxplomHyvVTTQOpfAw6tYx0wUNuDQ/Kr6+UzW+mR2ZUZvmMMwrEgSg6xnJgkt+6yuMenh1bSrrmMocQHgIal5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OxpkJqMF; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OxpkJqMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBOPRn2VSVcLhEPW/5WuzYRS5H0ZTfnRnxTUPoJN1J7NiUwJ9fl5jbd1GLzXRFQcJpaF8WKEHtMr6CsrMXEdiCvrunm8rFCesnBpU8CZKDzhwis00dJnAs2YFRNTiw8bEiF5PtuL/B8lEbIpFrzHKeD7XeHABu8mgrBF6dFNGsug8KdXt7TLTMhzOzDP7Rm/rw7Lg/ZG10bGhxMqWmyMu1tb4dCekkCoYfqrhWZyG9bcO329JNDdxoyaqO8c47BLQzO56M2+4UjE8BN5camVXY7SXOkgPYi7JgDXs41/odxdHa7wsClGeseGGc1jgxm7kEqkRu+8df3vgJ0e3WCP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73MtpaAfdgn7L2b73+Ju+38ksLpXv0Dt8/kObuJO5fA=;
 b=Sqc1o2CuDzIimvWTqwHjJsRKznwSjgtSvG6J4tqMQmMwgBjw+9jlGcI032YgEy5FpBn0kSFpPpAlZKVux3d3QL/iZWuY71e374PWPPAAHmjPdpS0xzH1Bd+eaGwc9Rie/ZYHUqRVNPrFl7pbU/gfmihdJRv6sg9yMXpHby2tgGpaqugCYPldoqSIcPqO1tdEZ2yAM38UdI1rQbedvZQBSVcQC6KUo1oF5SQr4ibK1xAO7ZoT9j9HTW6xp3I3fOjwP3s/QF2OhNKMHT8z93if35O5ACxIShNMYGMjUyqgcIXXUcn58Lv5tBRzKvVTnE8ci5YTqJK5O7Z6rO/U9mVxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73MtpaAfdgn7L2b73+Ju+38ksLpXv0Dt8/kObuJO5fA=;
 b=OxpkJqMFOIe9IWJDrFl7vO/aXddPXb+m9GpnKY+mox4LhzwfPrQfPTEzrb4voS66R5HBnBCaeF3X6Px3/q/IjvLM05ctwGfUHhHpaV2eQmDQL7ZZ1m4ZwSTRhslczP/SJF+lBF/Oo52D5PeFtehJwy5Kqb4xo02AEjh89P/Ju/ZzFRJOSgkEnLB0ZrSJz/nUqQP2i4E6WSKywvHW4XZUrDMeWSon4ekvz44zcMevKFZprTzM6gJeVatjivutb2q8yfrg927bqKg5YeVAkQ6FZnrU7GfAIwRjl9fJ1H5Gb2iTeuap9ahu6csK4ZtJDEccEZnx1zzsPY4cyx2wrSY9xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 01:14:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 01:14:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 10:14:48 +0900
Message-Id: <DIZ0LJNPWG9L.1WJCBXNFIUU1V@nvidia.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Benno Lossin" <lossin@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Eliot Courtney"
 <ecourtney@nvidia.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Timur Tabi" <ttabi@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Gary Guo"
 <gary@garyguo.net>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "David Airlie" <airlied@gmail.com>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260602032111.224790-16-jhubbard@nvidia.com>
 <20260602033358.5F2B71F00893@smtp.kernel.org>
In-Reply-To: <20260602033358.5F2B71F00893@smtp.kernel.org>
X-ClientProxiedBy: TYCP286CA0242.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c543af-c334-474e-08c1-08dec10d83a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|56012099006|4143699003|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6zrCkqzZ5zBZlx42zo2fuoPpl+ZLBLN3a4V1SYLSJyQh0/Rp0fvvutznF9PJRWHrnGiFF/Jhq2TAztiMWR8XKC8r85BVtGb25I/3KeJrph5OVsD9GRNuxWUe2B7TLr0arkv4KVnobWm86khQy2I/Cxtxruo9FPs7JK9Zde4Mt0TLgGQDY+Se3OfD30pnllUpaDlJLxH9zARZAgf4TTKX1SdhTI9zJ2btu8n0qv1g2zdnm6RVIYJwNCxpR4glr7RJdlkIWmHqaoF2T14PnORLW7m/Cxzkc/wyIfMUF4h2hfv+J6TITpUI+0tDvGvVe+Qbxmj48nYHt6gpY9wXXSndoPrx2f9H+p7DvOZ0gy1zlQf1uCryNuBzKtv+jkaq0u/0sUgREiQplhM0x5foFyGua1c/u6n390MVNUtQb+h/OcYV5QJs/q7BVVfvGDLIuv78DnM89W0ETnpI4p5IirukWta/pMSDnRzsK2QzReqDIomjAnk25DJJ5FjTM/mUsWHQAq04JYtG3Y13HWS7wz4TzaQnajUBZuwfScH7yKKmtS+c6vzqMSHqHDr8OZjqKA30EtoFxFxM7YfFFGVwcUAOnUOx6o6AywLyyfMjBmXjUZ62CrpZclq4OTOLdCZmcbXFRQpFcLD3ui7Ttmhk7CYZ7XydbgC4LZgG2ruWRoAhaxHz7IcD9QDnFscfzrQ7W1Ud
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtkZ08xb0U5OGVLWDFlZ3JYMWk2U2JhM1R6RzlrMXgyaENiZExOQ1N6NlJZ?=
 =?utf-8?B?YS81UFVPb2lXQTFjZ0hCUUtNa0U5WW85dC90SUdQM2hZbi9UWko5ZWZGb2Zu?=
 =?utf-8?B?dE9Ha1lPUTNFMVJpSlZqd2hJUmV4aWZjaEdOOUFWWlR1V2hzTmNEZHNCdVdE?=
 =?utf-8?B?eVd2V1Fldmt1cklsd1dlQ0kvcCtZRmZBV21DaHJ2czBqUXYzVVViRjh2TnRF?=
 =?utf-8?B?eHl5UC84WWxUUnpqQjQxcWJsYVZIaFVDd1M0eUhCZ2czY3h0TFRVUVp6alhy?=
 =?utf-8?B?em1NK1dFTUxJbUZSYkdwb3VrTkc2Q01YWGpJeUp1Wnh2KzRNQmd3bysrb2ZM?=
 =?utf-8?B?a2gwTjJYaGRxZ2N2TmVnbjkwSTlOS01HSnlQSWp4bDl6M1VVSHBPZlQ1SHdK?=
 =?utf-8?B?UFh2UnVseXl3aGg1VFI0bWQ5U3FMRWl3R1R6MUZxcDdieFVjdlY5OUVJUlRx?=
 =?utf-8?B?cWJ6b1BhWTZ2QXY5QUVldXdwUlpPQmdYQ0svSXQzSFJOd0hVTFp6UTlSTjN3?=
 =?utf-8?B?Z1YvbGdNT3BBby9XRzVvWUJtWm51cnY2ZGN4QnR1aDhrZ2M0bWY5MDI5Rllm?=
 =?utf-8?B?OGJxY2V2dno1N0dtYlFuRGZXbTk0MURlMEdIbGw2bWVWWFRCWlRReEc3b3ZC?=
 =?utf-8?B?ZXhwRnVCcnJzVHBxL0loZWsrRGtBOW9GWitJMndTOG5wakNRZm94YUw0c2hG?=
 =?utf-8?B?cFhiNmRFU1B4N3ZocUJ3T1VpZmFxN2Y0M1FhRW9GTTdCMjB4NFhSa0JpWG53?=
 =?utf-8?B?YVZreDd4bXUwaUIvN2R3b0lxWlNnb0VveFRTako0enZUeVNCNG9qaVZOSGlv?=
 =?utf-8?B?STUzTEcxU2VOczdJZTlBMmtUMkVUbWtzcEZpYlNSTWY3c0JCSGt2ZURpajNY?=
 =?utf-8?B?SFRPbTJhWjdFMGdPNkFaK1lyK216ZTRHMmx0Tm4zcW5IdWl6Wmd6V1RQRzJG?=
 =?utf-8?B?NDlUZyt1MFdVMUpaSGRTSjExTmM3NVQ0NE1FdnV5QlpqQmI0NGRUNkl0MXFV?=
 =?utf-8?B?WFRnRXl1TXA3MzVmcHduNDQ5eEV5Qkp4OXR5bEIvQmRIZlZyTkh1ZXdNdmk1?=
 =?utf-8?B?V2UvYU1vdUJhR09NbFZNd3Nad21IclRSUGlDRDRoNHpiL0s5WFZsdnlORU1K?=
 =?utf-8?B?My9DSmRuR245c2puUzV6OTJTWW5aalZpSmhSaG51WUpCSUNOSDF6c3UvWk14?=
 =?utf-8?B?TDNBWU5XcTlNODhGUm5DZWJEVldWWGFQYWs1a1E3ek5LMWhUZSsxL3o5eXZj?=
 =?utf-8?B?NnJ5azM3QWhFbHVaN2pudGFpY3BHU2ZpdldFL0lGRmI1eXYyb3hEeUlTOEFJ?=
 =?utf-8?B?Y3BsVncwWDc1UmhWRXpDVm9WRTl6UWFjVHBIaHQ4VUhscnlETjNHUmQyeEtr?=
 =?utf-8?B?K2JTZWFFYUpCVEtUVXk3VUlWRFBDaDBuSmxwQlN3RFJQTUhmQWlZRlZibERR?=
 =?utf-8?B?M2tJUlhRM2hmaFJ1bzVpOXppelU3RlBzeEIwTDBibUlrVVIrZ0xGY2NiYWw0?=
 =?utf-8?B?MmJ5YzQyQXIvV3VqOGNDeGFsUkc3UkRVeUdJV1hDbWR4MCtnQjdmRG5UZFMv?=
 =?utf-8?B?VmFYK29aQktzMXRuOXR1dm42NGpBcjhrMXFnWHRNZ2JPZkJ3T2E0UTROYjhB?=
 =?utf-8?B?WVNwTXhjdmttMmNjaWZQL29vTUMzRzFHZkp2c0xveTZ5bk5TK3UxZkRpZVRj?=
 =?utf-8?B?THl2M0E4TjVUU3JFSjZTbXVXOWdGRWhFRTFUYlFOZnViRUxrbHk0Ukd4TnRL?=
 =?utf-8?B?Uk5ZQUh4MGFGTVQyeGxPaHVZdUNjUElwUHM3WkxDcVRLeWE3MzZScFl3aU1B?=
 =?utf-8?B?dTliUVpOUUNiaEN6UUQxcEJKcnN3TEpBNnJOcTZRSXh5b1ZkaFh6OHlvQ2FI?=
 =?utf-8?B?R0RDL1FXRXJPd1hYREgxQkUrSiswRVBEczA3a1p6T0lrZytlOTZtdHl3ZC9S?=
 =?utf-8?B?MDRvUWFsNWdQRVI2V3pteWptTFphS1hrMDVWYTJ2MHB2am4rcjZQZTdsR2Zu?=
 =?utf-8?B?WmtCOHZGS3ZkYWhIYWJZcHM4bks0enF1eS9tNXlFc010K2UxVFc3VDFYM0l6?=
 =?utf-8?B?bTk4MFZPRjJvVlNvZzljK0xKeVI1b3c2eFdCeVYxaUx6ZFoxeVdsblh3Q2pC?=
 =?utf-8?B?dlg2d2ltTGtYZGdyeTFTQjF0VG00TnBLekdQaGxZWGNnTS9Lb0xyd3F2OUVY?=
 =?utf-8?B?anpSendaN1g3RTVLeGtpcVNZeE9rRmxsVFlHcEZXNUFpbkNTK2dHR0dwYUdD?=
 =?utf-8?B?NlRHd1ZZeFJWODdVK3R0UlBkRzlzVE9SWTYxbUVsQ2JqRmtndy9ia1ZQUFBk?=
 =?utf-8?B?ZVFLVkpoek1jQkdINW9Ud3A2bTlSTzVyMGd4d0plcjRzYm92eUNnMUxoUUJK?=
 =?utf-8?Q?X6rLlDPunYYQVEzvJsuZtgGENzwDvViAik77vH8m+Wl1p?=
X-MS-Exchange-AntiSpam-MessageData-1: rlkybuGn0Y5mTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c543af-c334-474e-08c1-08dec10d83a9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 01:14:52.4085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s+8IwVocyJEWazzs39nNeEIrpRtoARwUD2EZCdIwuKhg2azDWydTi9yhVGiZHsgAY3PYkpViB2qxGyqFMbpXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635

On Tue Jun 2, 2026 at 12:33 PM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Race condition due to incorrect order of writing queue pointers =
in `send_msg`.
> - [High] Silent failure when sending a 4-byte message.
> - [High] Unchecked integer addition in `poll_msgq` can cause a kernel pan=
ic on untrusted MMIO reads.
> --
>
> commit 8a59b49984011320aa631b20a05550242e2baef2
> Author: John Hubbard <jhubbard@nvidia.com>
>
> gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>
> This commit adds the foundation security processor (FSP) message
> infrastructure for the nova-core GPU driver. It implements queue
> registers and low-level helpers to communicate with the FSP falcon's EMEM=
.
>
>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core=
/falcon/fsp.rs
>> index 6b057d958115a..0ec1c55213bc8 100644
>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> [ ... ]
>> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, da=
ta: &mut [u8]) -> Result {
>> =20
>>          Ok(())
>>      }
>> +
>> +    /// Poll FSP for incoming data.
>> +    ///
>> +    /// Returns the size of available data in bytes, or 0 if no data is=
 available.
>> +    ///
>> +    /// The FSP message queue is not circular. Pointers are reset to 0 =
after each
>> +    /// message exchange, so `tail >=3D head` is always true when data =
is present.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
>> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
>> +
>> +        if head =3D=3D tail {
>> +            return 0;
>> +        }
>> +
>> +        // TAIL points at last DWORD written, so add 4 to get total siz=
e
>> +        tail.saturating_sub(head) + 4
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: High]
> Can this unchecked addition panic if we encounter a PCIe link failure?
>
> If `head` reads normally as 0 but a surprise removal occurs before readin=
g
> `tail`, `tail` could read as 0xFFFFFFFF. The saturating subtraction would
> leave 0xFFFFFFFF, and the subsequent `+ 4` will overflow, causing a panic=
 in
> debug builds where CONFIG_RUST_OVERFLOW_CHECKS=3Dy is set.
>
> Should this use `saturating_add(4)` or another form of checked math to ha=
ndle
> untrusted hardware inputs safely?

This is cheap to fix, and indeed probably a good idea.

>
>> +    }
>> +
>> +    /// Writes `packet` to FSP EMEM and updates the queue pointers to n=
otify FSP.
>> +    ///
>> +    /// Returns `EINVAL` if `packet` is empty or its length is not 4-by=
te aligned.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Res=
ult {
>> +        if packet.is_empty() {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Write message to EMEM at offset 0 (validates 4-byte alignmen=
t)
>> +        self.write_emem(bar, 0, packet)?;
>> +
>> +        // Update queue pointers. TAIL points at the last DWORD written=
.
>> +        let tail_offset =3D u32::try_from(packet.len() - 4).map_err(|_|=
 EINVAL)?;
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: High]
> Does this create a silent failure if a 4-byte message is sent?
>
> If `packet.len()` is 4, `tail_offset` is calculated as 0. Both NV_PFSP_QU=
EUE_HEAD
> and NV_PFSP_QUEUE_TAIL will then be written as 0. Because the FSP protoco=
l treats
> `HEAD =3D=3D TAIL` as an empty queue, the FSP will ignore the message whi=
le the
> function still returns `Ok(())`.
>
> Should this enforce a minimum packet length of 8 bytes or return an error
> for 4-byte messages?

This one looks bogus (looks like the claim that `HEAD =3D=3D TAIL` means
empty queue is hallucinated?).

>
>> +        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(t=
ail_offset));
>> +        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0=
));
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
>
> [Severity: High]
> Is there a race condition with the FSP hardware due to the order of these
> writes?
>
> By writing NV_PFSP_QUEUE_TAIL before NV_PFSP_QUEUE_HEAD, if QUEUE_HEAD wa=
s
> non-zero from a prior transaction, we momentarily create a state where
> `TAIL !=3D HEAD`. The FSP may wake up immediately and read from the old, =
incorrect
> QUEUE_HEAD offset before the driver can write 0 to QUEUE_HEAD.
>
> Should NV_PFSP_QUEUE_HEAD be initialized to 0 before writing the
> NV_PFSP_QUEUE_TAIL doorbell?

Here IIUC QUEUE_HEAD is always `0`, so this is a non-issue.
