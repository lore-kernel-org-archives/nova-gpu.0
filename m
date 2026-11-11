Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368849;
	b=d5uuYOddLHaKzkQbOm79OPNwoQcf0U8eI9Ifoc8cYzVdQ/Z4x0yT7pVy50Wr/4mONbvW
	 aLxtIHvaU519SEOoQwUpyCNE8ooBar7EkVpc8PHLm5kzm+wyLhWtf41SrAIh/HqMlTnkm
	 j/odqTBxIhnaA1p7xBOorHBQwbwCfZaNY68UVnqk024MT7k3G/kUKHdsHNcuGuHisZP66
	 bPo5qYTbLrSYt2M/tK5SvHi+Sy8kQO5CMyELPUBjOgdr5ho7ouqtPRJmjzFEvJhuuLFVv
	 ZhwZedsKkH0ONxvW4oqB595vcMulR9jnGBa68hGw1UWWt82RoLnQmZ/Emmv9eR0Eraw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368849;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Vx1dlch8RY2AaMTtYpOSqtqepLojexSh0esHd2biEng=;
	b=3VMjSNPgZdgxPxjuhToBgk8TX1GFEahF3tMcoPUW5vsTHD8EC5VGnTyZ3N7IJtfU1H3N
	 LRB+bcMqTx49MDF56+MaO1ZXSs88GjeCdsCRf1eiwqjoecsqFpew4vKqkHFz+yTSQGOuc
	 cyMXsPGxIfS9WixDmdoNZmIH4gpErlM6ZLItfsm2R8ZEbopYb5OGblp7YXqIgQliww7Qn
	 gCYWy4dAZ9uSbUDO8/0J4asjHeGbpZSBRAeKbXzioE4v3h9neZxwgN5dEC/mqntAX4oyM
	 DyoB/khSCMnJGPe0Ga2TPlbWpSJNnfCyhwYLXwwViGjlLzXMDLcpEL16j/qpQsoyQ1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DyEhZ7ny;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.19
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94925606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 03:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94925606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DyEhZ7ny
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3P7FgMnr/VxdxuUYZhqXBB/irJa9MG9Ks/2Aj1rXEVYzc7qA1RMzawAW8OWhth6f2x7E3XOaxbvUF5nQlmco1chLiv6hMYKCZW1VTwnwWqUDMfl2ZQ23gRzF33jti/r9sZYk0phBAlWBVsNYVSGxup9xP6Z7ki1ozUL8dflvB2VxNk5xlX28rOyBk3kfSbO3zV37MKnsXm1q0tOvx0SKr0F7otvu8uaRESDoq9j4FIaIU6qty8C4/p2cnjAXZtGLOTq5NNnP5eftJWj1LP/H3gevz+kTBhh4GSxvOMiqV9a+Lr4IsnQNfIboMAMuSoKtlaUK758H91e8fMzNUJ7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx1dlch8RY2AaMTtYpOSqtqepLojexSh0esHd2biEng=;
 b=Cb99ViF/IXsB0mrdjveMn7dHz2GlsY8IhW7ljc2Odthj0JToY0gvP/NbbrXZg588dPDGwcNKbxh7i7q5pZnRh9N9ctP0bcx2etOZX7S/9Yl0FWVVUxsnuYCh+G8dR0EPzoz4qh4qIaDSRBwcFqCbh53UIQmTf0I1MIw9TEbbEAGxzB6KeumwUZpkYnGaZbwPBB7B4tHwwH+iCluOCN0M+nLIh1mUZQ01aV9uR1EDajgNMwP/XW6xTUdM6Fgdghwx7w2fJb0x+cX1OCFiiJVq9P65Mmit4QV0ml6beK7che4yt4ShsrClFC8bndMUrrbh5h8NpV6mjv5+gPkJYPPLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx1dlch8RY2AaMTtYpOSqtqepLojexSh0esHd2biEng=;
 b=DyEhZ7ny+hI+LXRPS2/8JiqgbWN7wAiCMh8idMqBnpJ1pybrphmkSapO4t6JH//u+n7JgIIKAgBEs1YhenZYIZAR+CGnTaCnuLNH626Tb2diYf22ev/1drXEXDauj30f6TcXMfYq/T+VEJvhePGM68gfMETZ7tzPEkrT5+2sggLJIMuOC8va7yaT1+IetS9LaLAwnYyFKcnqENpAXC865pWt0kzPR67AsBt+jSm6+vGMRbuUK4s/qAXuYFcN4tcxGn6ti6AOHLjf6tIR25vcIG7rp+JZ/sgOXKUN3wmzJdsRP+bFksV/Ueuo+BtxQCEOrrUdOoynz2v9ib/AQwcEJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by PH7PR12MB7426.namprd12.prod.outlook.com (2603:10b6:510:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 03:45:36 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 03:45:35 +0000
Message-ID: <58c3cb46-d871-47ba-bb91-da6712b56c48@nvidia.com>
Date: Tue, 10 Nov 2026 19:45:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
To: Timur Tabi <ttabi@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
 <20261110231053.1352163-2-ttabi@nvidia.com>
 <199d4ffe-780d-416d-9946-f21ef18678eb@nvidia.com>
 <8f6caca82e82f457a24984503ef8fe896e0afa32.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <8f6caca82e82f457a24984503ef8fe896e0afa32.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|PH7PR12MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: f1888ac9-94f1-452c-19d5-08df3fa63e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Duud9hueYawrD/LbgLwsTwIyYOUtlODmGCmcGPZPhOy68HvekTb6gmUlfIHnKSP4O0ATk7P2zxA5+Pq/GdHoPsCzJApXvib8x8JCY/jg8vZALoIw2mmaXEMCHX2GH42OZBHbtiGEW/aArK2zYM8qOTc1Cb6FzQiq5g/iPQIRC1i4K3La5+BNkFFLuXDB2zHvyTC3kGyaZTHFqSrLu/UFIAz/bjniBeTUz0J9TpJU0sZCmb8rbtBk1H2udCLUt/DYRPBGKjKzYjVBsjNfmvQtCf/vYHVzlDkhAAiDq/V7DUrf/Qoqy3Hb3z0MSKMFCJaEfe3GCrVRmFKrGEhPPIWSn9I8cdXHgY7eiuUM44ok1uI9KcZlT/YefO7XwF3rTM8WaDdIQO0jAxozlUrorMVDRHpnUai/6B7+f8CuPRRxeXqeK2T5Ghi0PKMGhlK0spR4PVUXJuq/r6V9RbsZpciV/vuU+sKlJPFMz9W3t/JbYpDa8BjjwKpGTSGDa8244I5YoFgPoO8orDKAZcq0IEUxw27q+rr8HpgbEMotK/D0wzVztYTmKmp79xlyIb1qX/AzCB2Js/IMH1ir51jgvYWD3heGCz9GSLfmdKDW1l+rO7UloMJwUrnBUku9x3NkYfXllAUb6/q29AxZt+ZLZVWUOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXA4eVorOEpCTFF6cEVMclhwT3pxUzNEL2phb0pFRSt4YjlHWkdlWkNqMXpC?=
 =?utf-8?B?d2RHOEdpWkdqUUZRZ1V0aEVXUkNFNVcvVjFnUlF2YVV2QW5XQ0ZYdUF6cTZL?=
 =?utf-8?B?OTl4UHNsUTNYcjJIWVowK2wvaS9zWDhhMk1FTSthWlRvQlFEWGJhK1NNeXM5?=
 =?utf-8?B?V1FPeDBZRDJ2bU5xODFTNzc3RVV4aUJzQjY5eTY3WnlncnNDT3pFRWUzaTFR?=
 =?utf-8?B?NFV3ejNLalU0VkRRUW44ZkJtWmJtYWpocTlaUEF3Rk93MlFOYWpJODZuMXpN?=
 =?utf-8?B?My9lTFU4YlZ0MW9GbURFZHc1ZmgvVDdidE9pc0o5Mk43bFlodjNzaFVKSlNw?=
 =?utf-8?B?czVTWlBxV2Z1ZTdKRVAyUXRDZnRCVklXczVGZ0lUSkM3SE1Sa3NMaUFaY3Nr?=
 =?utf-8?B?bTMyNUFKVkc5R3pWWFNrV0NoL2RtK241aGxYblRMaWpVR0R2SnluQnYvVXUv?=
 =?utf-8?B?V3FUMEtYYndnaDIwUm5oVi9QdXBqTkc1a1NiVkpWaEdvdWlySmNSMVJLZHJI?=
 =?utf-8?B?OUtxQVI0TDI1U0VaQ2lNTlhEa3lNTHEzUVp2RFlTeHRIQ0Y4bklwdTNBc2hL?=
 =?utf-8?B?cjgxNFV4KzhYd3pHWkVTckc0dVlzNFRLYlU1dkFiemZEa0JZZjVheUVwby9N?=
 =?utf-8?B?YlZPUVNRVWs3RFppWjdHYS9NOGN6aEp2V25OengrLytrZFhDOG10NlkrLzFt?=
 =?utf-8?B?V2tCczVxZ2hwbWVvWjYzSklTMUtwOHd2Tk9jU0ZKcVNXSUJIOENneDRyblJm?=
 =?utf-8?B?UHY4cnZzU3hLbFFGdU1FcEZob2RzTDZDTzlKK2Z3Slo1eWlrUENWZkxwTXp5?=
 =?utf-8?B?ZjJPMXFPZ1RpelQ0eGJrdXhuZmtsaTd1RWF4YWFVYXFmZkVVVklzTU9Qb2xB?=
 =?utf-8?B?OVhwY3JnVHNRZEI0Y0JxOEU1TDU4cTZzTFllc0ZqREVZYmcvamdCVEJnc2w5?=
 =?utf-8?B?c3N0QnZVUS9xVnZhRnNJYjVuRzVxVVY5WG1DSk0rd1BZeENMUytpcFVWWGJo?=
 =?utf-8?B?OUhQVHBNK2VIOHAxMVZLTHBKS0s2R3N2Z3RtQ1RuOEZtNGU0MGlFWE9tSmZK?=
 =?utf-8?B?YjdFMmZGcEZOb0dXMzh3OEc2aVErc0dHNjNHNGZBUjlkSXhWbVBkNkFoT21a?=
 =?utf-8?B?RWFidkt3dkJIS3FEUFJCbldpQ2c3cGVNRVJxUkxuWTdTNURVVXAwK2hTOTBF?=
 =?utf-8?B?VFkyb1hYVG1iRlJQUlZ4aTRoZHRwRjIzYTU5aGMwK3RIbk5WQWhHUnN2M1RR?=
 =?utf-8?B?SVg1dWVTam5VblR2UHFGVC81dERPUDVyS2JBdHJTTDgxdTNsc3d1NFpLQVEz?=
 =?utf-8?B?VFhhdW9PRExuV0JVNVhXMncxSTljTFdzSmY4YUVQbk03R2xWWFEyNElKZm9u?=
 =?utf-8?B?YmxPajFhWHZla09xODdONUJYdElhMndsRDNGRk55SFZ1VDZUNU5TeElIZ08v?=
 =?utf-8?B?QkNDZGFHcUFwdTB4aEhBK1F4UFNDWlp4cUVzcFlhOHMrTmQxeHdacm1FeUZG?=
 =?utf-8?B?TUUrRVVCclF4Y3VkT2dQMmllNCt2RlIxeEptRWdDUjh5ZEpGUVhXakg5Vm1G?=
 =?utf-8?B?VzEzTlUvTnlNdEF0R1BZejBiRVdyTHdtNWlRT0pTZWpiVm9ZejllaEhVZFRJ?=
 =?utf-8?B?dTdDVThJTnV2UmxBUytGbXFYQWVDYnN4b0xCUktRY29qYTdzTXJ0QlVsRWxk?=
 =?utf-8?B?WHRWWUE3RjBzaHdIandrU1p1WXMwV0VTYkJkV2VEY1M4MjlRRDRVanE5NFBx?=
 =?utf-8?B?WjZhYkFLVzlja3ZtZS9HU09nZTJHcUpuVkovek4vRU54Wks4OHB0WEpCRkVx?=
 =?utf-8?B?b3BHckVqWXNGS3doQ1RwRjFiVThWN0txc1RjMTZjVmZnUmVmS3dYVlZnc093?=
 =?utf-8?B?blFWMmV4S3ZNNmxPUlBsdE81bnMwOGdodXI5bzk5cEtDblVRZTA5NTQ5SldQ?=
 =?utf-8?B?ZGQwUFpVa1FReDNrK21lTi84bjBuOEVzSnRWWmh0cVJxVFBzeDlvQUwxTE9r?=
 =?utf-8?B?OHRsdEJaYWhtUnJQTm9jdzFKdEwwRjFBZjhxWm1wWllnblVoQWQ2Q0loNklC?=
 =?utf-8?B?L3I4OUFLYnlkNWkrL0g3UzB1YkxBU1VZMmZtQVAxbVBzcWdjRWNKaG9BWWdj?=
 =?utf-8?B?UmFuODY2dHNXY21EY0JEck9YNC85K21YV0hDYlQzS0tPQlJXaUZONUNzR2VL?=
 =?utf-8?B?b3JYU0ZXZS9PamRONlk3RldaT1lXR2ZkTmxiNWU2bWJOVlZYUzJJUmNScjVV?=
 =?utf-8?B?cFNTQXpJcFcrb0xkV0NMd3RFazRlQWZMc2IzTVY0TTNIMGJiMytpU0d3SFZl?=
 =?utf-8?B?b08xRzNxVjhtbVloa29hUXRObk9pWUxqTEpXaXhnK0YvTy8xQXBMQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1888ac9-94f1-452c-19d5-08df3fa63e53
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:45:35.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1waJv+iAC7AXfdNbBOwSRo9Z4KhSSH4Nu5ViQ7Ixx1WvpovjRextGOJe5AhQtV2VhS6oFT8ROfZpKsiJX4F+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7426

On 11/10/26 6:59 PM, Timur Tabi wrote:
> On Tue, 2026-11-10 at 16:20 -0800, John Hubbard wrote:
>> On 11/10/26 3:10 PM, Timur Tabi wrote:
>> ...
>> ...but then first_chunk() checks the length again, and also returns
>> an Option that is never None.
> 
> In an optimized build, that check is not actually done.  The only checks are for the match
> statement.

Nice. OK.

...
>> Instead, we could use try_from() to check the length and convert
>> the slice, in one step. Your TlvBlockHeader::parse() already uses
>> that approach, and I think it would also work here.
>>
>> Something like this:
>>
>>     pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
>>         let value = self.get_bytes(tag)?;
>>
>>         if let Ok(bytes) = <[u8; 4]>::try_from(value) {
>>             Ok(u64::from(u32::from_le_bytes(bytes)))
>>         } else if let Ok(bytes) = <[u8; 8]>::try_from(value) {
>>             Ok(u64::from_le_bytes(bytes))
>>         } else {
>>             Err(EINVAL)
>>         }
>>     }
> 
> I'm more than happy to change it to whatever other people want.  I went through several
> iterations of this code, working with Cursor to evaluate each one.  IMHO, they are all ugly and
> hard to read, because of the from_le_bytes() constraint that I mentioned in the comment.

The reason I responded was that I think the try_from() is nicer
on-screen. I hadn't gone all the way to the asm code.

thanks,
-- 
John Hubbard

