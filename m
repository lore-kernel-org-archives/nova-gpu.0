Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78EA2BDC0E
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043617; cv=fail; b=FNNpc1HLF5DC8C5jENMUVYfLw12MlIsLwE60HLxeS318jle+ruJA1m2cMI8OBSr4rOmsAL9IOCWVhIROgZbdJn8mjrdt0iQq35StaGq+azi9yffR/kb8AaA8TgMqkSo6j0Wppdz3qR7KK1ZLvdQyl2ZHMnECG8ZaC4650af8rJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043617; c=relaxed/simple;
	bh=GHXHSmdByoodjlKwlGf7Du0hkr9UqGhAhcMbOKI43tM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j0NyGmji5yysvkqLB5OSTPOLxZnXeE9zOuTYu57zPz4XxQwfV/dNExk0jpzR0NhPghbFkbFXUAeK2EPdCgYFE4LW2hW6qW8jOPngix0EVAOX4dZzoeMwDtG2mxvHHbB86tYasr8JQrgQISzbdc4NeoWwrfeg9NwjECEukQ3PRzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JuKR0VLy; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JuKR0VLy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khk1WWvAP/gN4LteFML5Df8MDjbGM5UN3twDDuELuR9mpXVVzT5KAdH4d1p7Bfj0PPec8ypYeEoXMUTSz+wioRAcQmdBJ9y17kVvAsGUj67eWKBvbH8oV91BSJwNYlioJQIgQ3EL+FxCAZERI3Ec00LTILSSGNzX7zikydFTb5f4nDXb1xYZfLyX690Wma6qOpQkxpOLJ8/PAEFyxvmLC4yqmKvRBWMXOVDKI/9kFXjkQltO6jzzl89R7chKyvHTQgxErELk7mZJHwTR/WS9IO0aUP0Bk2GXr/qtUxLcz3Z/khwuZSH7tq00bn7kR4H+oY+tXUud/SbYYGqXjnNBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCWOyQVud88+goWdPbwLgb0mmTsnUkmwSk1KFLSEeAM=;
 b=d8KNaFUk8pH2wwSjnIrwoP0esoBbRBnEOjyOpPJ2Ema6ksVBdMoRL1M4Jz6f8uuPfoqFEuUVR5O92ca2EEj/ECD8kcuOsKqO8Hp8Qt21uQwI2uJmclVh226+9galhxoBJHtbgQ7pLxbouRzamhb869MeSZV6DFKp+mIqZMvi78gh2FT3RRihA4PgDoBK3liROtuX5QXqc+Q/zbMur4BuPH44Cc7SP0EYU3l0VA1svMbZVHOjtog1H5kngfXEEkBJe/r/7Q4Pfb6yfs7kvXKuXrHfEkMFJ7IWoQquYw8hT2JBMdGqF1kWYpop7q0u8x0imlzybN/WtBL5M5mrv8gwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCWOyQVud88+goWdPbwLgb0mmTsnUkmwSk1KFLSEeAM=;
 b=JuKR0VLyh146gk/fQhk0yq0J94azyKHtIa3bPojqY5uH1dYNDTdp0Tl9cMpGSZECJmCnEiHm/F8sBNup/+qX/Px8a1Ylj45xi5d/QAlaUfSmUKbdFLdVPeLtkwGZ0rdD1EqZTIkp11Sp7mf3xArcxp+p1drn4WOY9CLsDqgyB5DzYwU67RiOEKoiHLaDLmY1dASW8E3om/V5R233BDm+ndIjs+3Eup0t48D2bXVx17lqQyh7LWIbi47dynHh2y+fwifBj7LRsGuqFCm1f98udkq4cWTSubKXwGq0lPiHCsprlx8qBNwH4I/znV3eLl04jlehfLnUUQSyR9qtnZFm/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:18:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:18:29 +0000
Message-ID: <fca2cb8d-771f-4cd0-923c-d2094e0c7452@nvidia.com>
Date: Mon, 21 Sep 2026 19:18:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/33] gpu: nova-core: add GMC API message types
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-10-jhubbard@nvidia.com>
 <4de99bd13d2bd80520288e22de12e4b2907628dc.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4de99bd13d2bd80520288e22de12e4b2907628dc.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: ab978f73-90db-4b4e-b872-08df184fca6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	267YvAoAlFXfnXYXvNGdrUru/PDsKSWyKgERHO2heoe1apXCv0MU8A7fGvP9G3VEE9ZYW/1aBkouTB3KC9CJVdDmk8j3zwpdsbo8GfxHi7hdgNTYsQu9nS1SRWQyGo2Tvhh34rYyXNI4W1+tTDdjgPzbXVcSf0yBHtxXoyCgworw9PRaQVrqAaRALXsnRDwXBgdtr29/hjsN9htUEsC/p5GNTuXedPyXPI1rUi4h2bu7LIESgzd+fJLXnEoTZdfuj4sGAF35kwDZ0d6jq+zP3Vc0gWzD38ZBlLJNSN6i7y8D8UtEdqhMPyEDEOvdy8X1Tw4jdcuyRZM3r1rnUambpKmQZ7xo9tPzjPT609EMBOWsPG1qkh9rYPMDfUHbvSgmgxJqZGyO/o5xasPzZNp+/KoroFFwY+uE8E9lFChpzlT1AVA5MGFrtPksj+XS/UrHkWlrX9uzeCcsJ7h23TE3UmCez2LOTtwh4Jqpln2UzkFvvUm1mrKPmGAXM9k93XDHuFJECazB/DGFC889F3lHRANBK9Aw8/ZE3lvXXSCW/ZARkZixmGofned5HToWPL56bBkckIAlyCYwi4/29/6zAdagaziTybkcGvizKrMhcHXoKcGSNit9OI2JsCJqrU6FCSw12tOx2fr1GX37EtrSZ8T/11TnIm3DV3CB/x1qCI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1RpcnJhc3BGSWJ0ZU8zYXhTRGs3SlUvYXZ1MXR2SlBJNnpVL21FYU13MEF5?=
 =?utf-8?B?S2NpN2p3cEZTUmxIVkUvMkdKUjJSQm8yeGFWR3FtZkNSU08yY2FYczQwVC9a?=
 =?utf-8?B?djA2a21IZFUwZnh4OC9nY0FBVzg5MGo3WmFubVB6M3RmYmNHVW92eGpBN292?=
 =?utf-8?B?T3J5ekt4cVJBbDMwcjNwK2Q2bnBRZEM3NUxSYmttSUJHZUUrejI0VlN2Vjd6?=
 =?utf-8?B?cDlsRGR6VXF2b2JHbzZ0UlI0NjE2YUpGMnJhN2s2cmg2QkdVTHlEMzRGVkQ0?=
 =?utf-8?B?ZjNIa1RUMkpDM3JoZmlkUjRWaFFFVXlzVzNIOWJITmxWaU4rcThXSTNNMU5G?=
 =?utf-8?B?MUpLZ1dVTlpSL051YUxOd2dMeXYvajkzc0FQcGlmZ1VyeFM4VUNFYmhLblZY?=
 =?utf-8?B?WVdpenRkTmhLL0hVQ2M5U0pTOEQ2dnZ6LzBQQmZxZzR4b0dpY2NuV1R3UzVL?=
 =?utf-8?B?aFdab2JoV0tDZC9Gc2lCUjNNdmhVbUd3bDhuY04vTWhkeG8zeENQenRzakNM?=
 =?utf-8?B?TmVjbWErZ2xCSGtFaW9vdVlnOElIYUNSVDJ6NytWL3FhY1V4N3NacFhQMTR6?=
 =?utf-8?B?NWxXS2lUUkhWK0h6WnROMmd1K3VreUJCeWhaRE8zVXVhTWlNdjZJSGEydmh2?=
 =?utf-8?B?dksyS2EyTUhCZG10QUdRMnhlbFh4QUh2Q0JyR2lWeldwdzRQYk5OdjhIajJK?=
 =?utf-8?B?alg4eHB4SnYrMllnSHdScHBSdi9IV29kWkw0UzVQWGZXL1NkZms1WEdadFlU?=
 =?utf-8?B?Q2M3ZjF1Ukt2ZVBwOGxRMFRDci9mTlJ5cHNTZEZhSUdyM0o2L29tQ05PSjU2?=
 =?utf-8?B?akxNWnNJSFRBVDNrckN6ZUZDNWVtSW5WOHpBRWtmQlZNK0JqT0w2eGpTUHpY?=
 =?utf-8?B?WmRGNVFmckFEMnlzeC9kMXBMRUdOcWQ0SWJrVkVyQ2J1T3l1UUVYVFZncGhE?=
 =?utf-8?B?LzViamVybzUvbEk3S3RhTEU1d1ZVZGtSUit5b3NRMGlnWGxnVmN6bzI1dWhj?=
 =?utf-8?B?V3BCNWhCMmhSRDFYcTErd1pWT1RrU3BlYjR3aWV3QU1NalQ0YXdKQUVrV3J2?=
 =?utf-8?B?dHVpelVSLzROUDRmU21ZRExrUmZRSE1POTV0ZUtYQXpXRUFiQThGTWpxRGRM?=
 =?utf-8?B?QTNLZmpKUW9CeGZUTVFOemM5SkpVZ0VtblF5V2I0WlVtaDQvSytEV1doKzlR?=
 =?utf-8?B?dGlXQW1uVDRIUkRvdE5xSHZhV1c4RUloYTJzeFBhc0czTytUbzNuOWxDcUc0?=
 =?utf-8?B?eGtRM0IxZk5DZTh6WFhpd2U3Y3RLRzdtNXA1a3QrZTJ5dk9LaTY5T20vSkdP?=
 =?utf-8?B?bW5pbThkRU5UOVpncDFnY0VCeWFLRlpKRENjMmh3cFBIZGx4TWptSmhBNlli?=
 =?utf-8?B?TkRYNkNCdndRUmtxTE9OUkJrRTd2a0hjc09aSkZYYzd4VWg2QWFraDY0YWpp?=
 =?utf-8?B?TzRhUzZRdFhXZFl0cjBGOEIxQXhmN2p2QXViVExVOXp6UmUrOWxGM05oRWZM?=
 =?utf-8?B?ZHFWR2pCY0NrUXJpeCsvNXNWTHNvMk8wZERjdGVBTC9zd1RWR1FqenhEZmNQ?=
 =?utf-8?B?QlFGY1hGdzhHU3RBdk56enkzNUIxWm9DK3hDNThQbHE4eFZYcDkya25MSC9H?=
 =?utf-8?B?UlRPRWZyQ2ZmTGczWEh4aDVlNWJ1cWFFOGJCeHVUdHhCU2Z4akl4ZGJUTDdY?=
 =?utf-8?B?cGFkRTI3VllPYTNobkNEMnp6dnJmSE9aNWpyZWh3R3hueVZxbHluS3NIbDBZ?=
 =?utf-8?B?U081N0lKeDBIei9ncnNmUEFjUU0zRDZyNFJOeVlXWFM4QnpUa05EcUhrM2Zn?=
 =?utf-8?B?UlBVS0lZaUxXdzFWd2pINnlHdFB2M3lnNTZXRXpIOGVjd1RaaTI4UHZGQTBU?=
 =?utf-8?B?UnZsb3loN2c0cHJSVmpYUGtBM2RrMHg2Mk5tS2cyMnlLZml3TURzeFVWdmhr?=
 =?utf-8?B?b2RzRDdkekxRK0QwZCszNkU1V211aWNjODBodjdxcXRFYnVTTS83UkxVV3hz?=
 =?utf-8?B?L1Y4K0FRUm5Pa2ZxL1htNUNxZitNK2RnZFNJdGt2SitUbmpuOGRHYWFpV0ZK?=
 =?utf-8?B?RmlmNE5waDE3bHJwTXlyRlg1U1k5Y2xRQjROUmpxeFVpdHR1YjZYbDNXUWlm?=
 =?utf-8?B?bFhlNStoRE4xU3JNSjFCT1E2Q0pTREI3MnFFR245MUc3UVFsTFVNeHA5WDBq?=
 =?utf-8?B?WTJDaFdlK0hUdGMwK1NQWWhSWVhUbE93cTVrTElTNnJEVzZ3NDRnY3A5OWlt?=
 =?utf-8?B?ZHJNdzY0WmdoZmt6MndOdGFWdlFWUE15dXdjOUFZclBGam1acXEvNUtSUGdv?=
 =?utf-8?B?dUFocmU3NVFGZm1PM0J1UTllQ3Z5UkpvaUFFR25yejB2VFZwRE9XUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab978f73-90db-4b4e-b872-08df184fca6c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:18:28.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy5Y8aKsXY5fD+sBGMvkO/9NcQXWvdRu0PIn/gfL2dXSil8yCsh9tt2bXXrrEnxEg6Do+zUMmayOhwBEs8s9NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140

On 9/18/26 2:45 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>>
>> +#[repr(C)]
>> +pub(crate) struct QueueElementHeader {
>> +    magic: u32,
>> +    /// Length of the whole element: the queue element header, the message header and the
>> +    /// payload. Open RM calls it `mctpPayloadSize`.
>> +    element_len: u32,
>> +    mctp: MctpHeader,
>> +    nvdm: NvdmHeader,
>> +    /// Length of the message header and the payload, the queue element header excluded. Open
>> RM
>> +    /// calls it `nvdmPayloadSize`.
>> +    message_len: u32,
>> +    reserved: u32,
>> +}
>> +
>> +static_assert!(
>> +    core::mem::offset_of!(QueueElementHeader, magic)
>> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
>> +);
>> +static_assert!(
>> +    core::mem::offset_of!(QueueElementHeader, element_len)
>> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
>> +);
>> +static_assert!(
>> +    core::mem::offset_of!(QueueElementHeader, mctp)
>> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
>> +);
>> +static_assert!(
>> +    core::mem::offset_of!(QueueElementHeader, nvdm)
>> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
>> +);
> 
> Can you also static_assert! on the size of the struct?

Not directly, because it's got a union involved, but I've added in some
assorted static_asserts that attempt to cover as much as can be asserted
in this situation.

Open RM's layout:

  typedef struct {
      NvU32 mctpMagic;
      NvU32 mctpPayloadSize;
      NvU32 mctpHeader;
      NvU32 nvdmHeader;
      union {
          struct {
              GSP_MSG_QUEUE_ENCRYPTION_TAG encryptionTag;  /* 16 bytes */
              NvU32 nvdmPayloadSize;
              NvU32 reserved;
              NvU8  payload[];
          } withEncryption;
          struct {
              NvU32 nvdmPayloadSize;
              NvU32 reserved;
              NvU8  payload[];
          } noEncryption;
      };
  } GSP_MSG_QUEUE_ELEMENT;

QueueElementHeader uses the noEncryption layout.

Open RM has the same mismatch and defines the unencrypted size separately,
as GSP_MSG_QUEUE_ELEMENT_SIZE_NO_ENCRYPTION, which is the offset of the
union plus two words.

I've added these static asserts, for v4:

  * The size of QueueElementHeader equals the offset of the union plus
    the size of the noEncryption struct.

  * The offset of message_len equals the offset of the union plus the
    offset of nvdmPayloadSize within noEncryption.

  * The offset of reserved equals the offset of the union plus the
    offset of reserved within noEncryption.

> 
>> +    /// Returns the length of the payload that follows a message header of
>> +    /// Returns the length of the payload that follows a message header of
>> `message_header_len`
>> +    /// bytes.
>> +    fn payload_len(&self, message_header_len: usize) -> usize {
>> +        num::u32_as_usize(self.message_len).saturating_sub(message_header_len)
> 
> Is it possible for message_header_len to exceed self.message_len?  If so, then I think that
> warrants a comment.  If not, well, then that should have a comment, too.

Yes, it is possible.

So, in v4, I've made this return an Option<usize> in this patch, instead
of waiting until later patches to do that.

The v4 doc comment on payload_len() now says that None means the message
length in the queue element header is shorter than the message header.


thanks,
-- 
John Hubbard

