Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A53B4EBF
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975238; cv=fail; b=bPEgJhmHdkZV4OtEcdiAw2Bbsrm5cWqHGPeRdve1cdiKidixYZUS/oKjBPSakcS8iOGdP8xnO0+uFxzEnlLDlMvB0ueafEbjdxsNlvA5uaskYBH+IeOoOzFNhmjMByVxI6uQLvxDNwi2KGk53NeYuaydmiG3d5bcUwZKQbgRLw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975238; c=relaxed/simple;
	bh=qa/YtoseugqS3xzYGlfpdcwleUD/xjF5aRUuzgdna+8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=f7uiJnX6u5OtOy7VpqxWfwJu20MwP+YSUFsT+t45mPGz7CMYccRm92u1ZapNLYTP3LCQUD/v9e4v59RZkXMs00HNUC08Ml6K8hW1kZGRPvxoSg/Y+EbkVpSzyawMwY2SZ2IoWCmymFZ6Z0oqELs1q4xtJzuIAkt9my4Q523KXeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NV5PNq3G; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NV5PNq3G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xY849InrYQWjil+52FZ4IWF6RQWqn8a5Q2u/S01xeEvhpuqtRpX5h78H3/Ns1IBvg8JCfcdodB87G+vL4RruHstC9daSWuM+UvHiB5GxUAbWj/QrNinbdxg3y7FA5LmkPgZ8L1kv3zY2nvNjbKYYB34vD0lGdHOoGC0szQ95Z59NYARUf2uJ7Xd2QJfcW4WbmemIx4UAHudGV0mXl53j7kg/9LjYigsG4vELGnM0UNhgeOBxg0qAShnmU1JTz4w1FleYyhJcUue6S6jpYxKBbV4FpZIOU0fQ33wKyOItedzYnz6yI3Kp8cmNwU/AB5znffWEiUnr72zP0qu/5c6fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r0yy6Hlw8vt8CSMECM7LvNgmqBbWD8tuN63Yl2DDyI=;
 b=Sez03QayWIe0UFW9OSBAz2QC1E0l4PhBwgJfOiEYRq3xMojkWRQGbrLWCbMh46AJGKqHM8pi1LHH8sEx4OQVrY1lNeoQZWicALTlwr1S0E2/Jozr4cIQYdD/FOWhO1veolKjxTNSWPLbyAa+HXkdJIoUEU8vvpD4dlmEPAeDzAxvx8mazJbpa5Gv7tfDyn6MoWLpYksY/vrusooLV8gIiQMxA5p4o1hk3NGzV2pL//QTU+PAM2yl2TxvaKk6tEkHk9pRSzfu4iG8RzdMACawFaa3Eu8Fl5YKliTyEgKPc4R4AOnbV2RCRB4HgCvz+7xC5VjPFcF7/9qSJSGFlU0P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r0yy6Hlw8vt8CSMECM7LvNgmqBbWD8tuN63Yl2DDyI=;
 b=NV5PNq3GMo9y/M0TE+9/GxYaLHj826T1iQ35KX/xTZXKvCJmDLsrYm+XYQP7J96+1Ho+uzJhndRJjfK+UD9LvhetIiBQxII0YYh/Ux+Af4ZUjG8CTCi+c80sOvjN2CrA2ARSnZS2uQRl6kek3mSbjwTnO4P6/3B1C2llc01Rv6vIAYsBvkf5FQEW5R/TjqJsnXkcYrLuFl76zEp5pSei51+65SBMkge8WWpiURAp2SUzZAhqQoyOoHs4TBf32SaNHQP04h7dwUqqnJZ7u0DbLVUbErAO8Fr+oFQaNqkViOK9AY/mL5BqGgUgP45s7TNgBEdQf1yg+1fvexuBfiz6/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Mon, 21 Sep 2026 07:20:29 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:20:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 16:20:25 +0900
Message-Id: <DLKT9EQTLBE8.IB37OAJF42C8@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v4 15/17] gpu: nova-core: service GSP events from the
 SWGEN0 interrupt
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-16-jhubbard@nvidia.com>
 <DLKSJOFH2EZ1.21JRCSY7IY1ZP@nvidia.com>
In-Reply-To: <DLKSJOFH2EZ1.21JRCSY7IY1ZP@nvidia.com>
X-ClientProxiedBy: TY4P286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6dcee3-15ab-4ddf-377e-08df17b0d089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	84GjNuuqv/6hT55EWjk3ZVBRrn+zJzfVtB15dInRbSo00teu35IDS6kCR9o0n3j52OWcueNy9dx2c4san4sFdFKZQ2uD1p+scj1mBonjYRKDPjdt7l5NBKdPtvUFvU5MnZAgqOZ2CA9OiQ64frhzsPgTfwEzHDJSeu/XlyPkwDxxc0c/pR370mfDeN5Rr98/XIR0q0ylO+3tKhUbmHtZVvhAeCxEApDt/sj23aFuaEvdkvavE/ijSAckzT+spyA+RmhhA1itJm/mMBQqUKAxBa/eShSUrrItzRN8dYpJl+EiSco7TcNIRifEDEWGv9VNp2Vq5U3cQKl6hZJT8/eM8+qbz14Xo175I7VJ5Z2Ur6INPdiEapbuKnSCoVBLbwofZieIPq9oLMfAQgOoXjA0efHPgyjERsqIm+2/rEQRsPZ1R8X7DtXUPSYNIz8cw/skn02wBmGzmEwT6TjE7OFBmsRNRsUtuL3oXve1kc5vKu6U9siA8yeCBgI8NNAoopXVoNSpy6lApoDyF8K0+YgFOgD3oTmgIM5/XqHeCE1ZdC9oYV8C3Vzggh6OGK9tMODhp2qOsqgxWHCgeYtDouyQTHyb2rST73k8ScC8VjwBh8yTfNBodqaFMqn+CMmWs+gnXOdsHJLwWjpK4Lz/6g5Soa0JifHL7t79E0gLLoHJhHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhrNE9tL2VRemQzYmRKaWdmc3hHaFhPcVlEK0dodkVzMVYxOVJaaEpDSVBE?=
 =?utf-8?B?OTRTMnV4Wm0zclZiUm1SMjZ2MUE4MElLeFVOcHV2UkZWUmdyOGt3Q1hTK0xw?=
 =?utf-8?B?N2dlMFRqOE9oYjZBVHNySGFDS2ZENFYrd1YzdVpRajMzRm5NYm8yUTFnNVdj?=
 =?utf-8?B?c0hMTGNKeWNVS2ZsZFlXMklHMDd6KzExZFl6VjZjamdCZDNseFR2TWdndXk2?=
 =?utf-8?B?NExudmNsTXdNVVlpam1XcWg3Zkp4K01NcGdWNVJTbWIwTjRLUVBKWkxvMy9Q?=
 =?utf-8?B?SllkRGMxS29oYzd0RFdjQ0s1SDU3Qm5mNXY4TUN4Vk14dURTZ04yVmZEc1Vp?=
 =?utf-8?B?T0prQ0MzTURpZE9aVWRMZSt1c2w4dWxCeTc4eVBoM29DR0QvQTE3M0JveWN4?=
 =?utf-8?B?ekdmdTV2bFFNQ0FudzRQa29Md1lsQ1c0bGZlZUUxeTRqVEIxdHQ0R2ZEYWtG?=
 =?utf-8?B?K0JwamZGM0lqUTZ5TnN3Y3dUSlNkQ1JyRmdCVEhJaDVINy9TWFFLWHJFc1dD?=
 =?utf-8?B?a1NzeW15Q0o1a1ZoYXh3WUdva3BUTFdOenJHNWVwNkZBOWlKMXlwNC9uejlG?=
 =?utf-8?B?VFU5b0o2aVg4MXJBcmV1ZlNYaHh5S1Y0WnBDYytkallnL3JrZUhBUW90Vm40?=
 =?utf-8?B?MmhlOVFTczhlR1RUbjViUnRIVVorOHJoTnRsSDJNbW1DV0dqZCt5WFJBTEdQ?=
 =?utf-8?B?alRtM09aTCs4VmVaeHUrek43RVgvRnYyb0JIYzhxQmJMYkY2Z0hSS1BtV0Z2?=
 =?utf-8?B?Vjdob1h0bW0zNmMxVXJyV0NEdk5BNTZMMU5oQ1ZwTkhoS0F5N1FtaUV3TGw2?=
 =?utf-8?B?QnJoVVFkSGVsdXJDUFQ0dm1KWVFCaHVqU3M2TFplSC9KRlZFejV0UHNxYnhR?=
 =?utf-8?B?VkJhbjByRDZ6RXNFVk01clpDUkIyUGF3RDh3V1U2S2VTUnR6T1c1ZlFTUS96?=
 =?utf-8?B?dkRIVFAwL3NXRGIxZlRvZFB1b1hSanRsOFZBclFaYlFGTm5GVEliUXBjenM2?=
 =?utf-8?B?MGV5QjNCK1ZvL1pYMlRHNTNYTjBwOWhQTGxQcUNxaVhiVmo4MTdFaXA3Uk1H?=
 =?utf-8?B?KzRCM2ZxU05QeGdkdkJIM1Y3bnY2Tmo5d090c1hhUnRDN2EwclBmcHIydS9v?=
 =?utf-8?B?YU9CZjNwcWZPNXNVU29kdDhUTjNZT0tNTzgyeHl0NE1vWUdydEJHV2hDeCto?=
 =?utf-8?B?bSt3b3JFdjg3N09DekkzankvTVMwaElkbGZlTkdjQkRkWWV0N01mTTRtczlE?=
 =?utf-8?B?cHFDdm8wQnlMTjRqcnhQNmZOczcrb3hmUVdIdEFhT0RWNkFGeDFqUTBpTGtT?=
 =?utf-8?B?NzV6aGM5QUx6ZmJMcGdzT2ZubFkzZkZGelVaMksvMkdSU01TZXF1YlVVN1lt?=
 =?utf-8?B?RnlpZDlwQWV5NGI4UUk5cWErUU0wMktYcHJob2FHdVZkeUhrYWk3WkQ4R0M4?=
 =?utf-8?B?OWNhNWo5dWF1SHVPQzQwY0hJTThJcEFLWmN4MlN5UFplenNWa0JscVJtcy9m?=
 =?utf-8?B?QXJrZ3Zac1padFBnMjVvRDNQczg5MmhZSVVITWF4RUhQd0VMb3ZPcFI3TmFS?=
 =?utf-8?B?OHhscmZqaTVBbDNnQm1QZUVUY3hndE9na2xuSWJHU2pSSU84YkpuemdSYzhE?=
 =?utf-8?B?Tk9VblF6NE1sRzlsdlg2eG9hVmZPYmhXUDNjUmEreXlNbklBM3V2VWVVUExw?=
 =?utf-8?B?dFNsVDk0cFhjWmc1bDg1M1JOZFMwcHczcW5NRWdvSnBKcVlPSU4vTTZscFRy?=
 =?utf-8?B?eUJtSTNWcExLbUE2TG1iaG4zNTNoMnZCYyt1WGZSaHl0VjFrbnZoQzdFclpn?=
 =?utf-8?B?b3I1aVFta01kekJWWjlzbExna1pqSW13czN0YXVqNEpseDRVSlFDNHF6cERB?=
 =?utf-8?B?cEkvbUNRcEFSalFJRk43OWRHd1YrT2RsSkpQZUZwckZuUHVhWS9KNE5BdURl?=
 =?utf-8?B?VDVzQ1o1Ly9VaUxtbDRIVENKM1lhV1pEVzV2TWdVVXlDWTJaYVFDak4vZ2pI?=
 =?utf-8?B?YWFBYXdrcFlkV1RKTWJxQmpTcDA4amNUUE9QVDAyWEx0UkNVSXVaMXJISzk4?=
 =?utf-8?B?MW91NkU4cEZndUtBVkxEV0ZLT0ZMUU5SUVBWNGNmTGdwUjQzWVBtVDJiL0lu?=
 =?utf-8?B?RHNFYVRHbDZRenY4TUl2WUwwYTJNZUloRUg3T0haTm9WWHAxT1I3VkVwelRz?=
 =?utf-8?B?ajJSOHlrc3BGdXQvNTRuY2RBcGM0S0E0Z3FVQ2Q4STQvODJ3Ylh0dy8zL0dv?=
 =?utf-8?B?ejVBbDdHZ2UrV0lNQ0UzTGUrRWljc3VEK3ZXeURPWW1BdTdyTGc2WHNJd3dU?=
 =?utf-8?B?VGxiM3VHMFZtTXU3aGU2eEI4a2RNL2NubmdBN01qSU03UG5JaFUvY3F0d0dl?=
 =?utf-8?Q?6kOeqMZsJ+oS/Y+Hfc1bZ88/nknP/fVQ71t3vzNoBTvnU?=
X-MS-Exchange-AntiSpam-MessageData-1: 22Sw83ap+GxISg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6dcee3-15ab-4ddf-377e-08df17b0d089
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:20:29.1551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBuUH1yf0fK7kO96+82Gjz6RF1gS9n6io0+XZuSGhQAZYFd2ix76iRSmlS2lsWFLGg8kqUqppqIy4MEPCmvVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

On Mon Sep 21, 2026 at 3:46 PM JST, Alexandre Courbot wrote:
<...>
>> @@ -380,12 +406,7 @@ pub(crate) fn new<'a>(
>> =20
>>                  bar,
>> =20
>> -                gsp_falcon: Falcon::new(
>> -                    dev,
>> -                    spec.chipset,
>> -                    bar
>> -                )
>> -                .inspect(|falcon| falcon.clear_swgen0_intr())?,
>> +                gsp_falcon: Falcon::new(dev, spec.chipset, bar)?,
>> =20
>>                  sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
>> =20
>> @@ -409,6 +430,30 @@ pub(crate) fn new<'a>(
>>                  })?,
>>              }),
>> =20
>> +            _: {
>> +                irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vect=
ors_ref)?;

Another problem with this: `quiesce` calls `reset_tree` which then calls
`rearm_pci_irq`, which re-enables the TOP bit of the subtree. So we
effectively have TOP enabled before the handler is created, which
contradicts what the documentation says we should do.
