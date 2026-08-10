Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB113B71AA
	for <nova-gpu@lists.linux.dev>; Mon, 10 Aug 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786402563; cv=fail; b=hJRPx1pQ4AzY+i0nkFymy0+swHMjkzH71JkXTJIlogLe9jaBc/lnn/ucy9leaoy3yLZkVb0CZ0mxbXYRcdwa09mfPj9UvgyXS12Rr6u1hch4cKw16EnBU+MpHRt7sWYpQuV9p9lbiroeOFZD8T6kQ7uxawXwvC+qAtvz0LRWKiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786402563; c=relaxed/simple;
	bh=HkbGsbGO4jDIivfP+a9wZ1BeSnk17KJvBTwliEUBvpw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ch5yAVZBLq39jjQnnq92BtQVnetlh4Wf9+SoL1mYiwwVUA4fD2SYlkfupYdQhrCgWzLWz9v4npW68NKLFpk67nejdvfeUbZ2QyRJbTqkdVDd1xHLR2bu46Ygl+kbYbgr4T3rTbIvLrQF89qbPon7EoHQH+cL5nwS2DJo+5G/igM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YGvvM5Dx; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YGvvM5Dx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isz3wS86IkFSgDgJlcg5efM5iLfhNoVG0o9oxLfyZnRgKXCCT/drfkdG1sXMU+bgtlCxMpK4wpyRqf/fUDUbaPk3KeXEpX9/0GITuJOVY8eQ2/Qlzsw4YlN/ENnUmERQha7b+U2QCHv4DbHOJ9wqQxFTxO+9BLiRVorUuvv/AwP+ohWvL8DMnmCJuPzRcNja6BqTjzKf6G+rfw7FfsxMLE8uhl6y4+Yms8pjYRIx/Sv6OBrHmqaMUe0N2XoeeLNDZOAdZWJ/Iqz3NpKBrvDkYRA6Oef/ltMggkqqs1jwCcCedkggpemxBsoTSNUDVsGePcTJh7/FAr8U6Fcvwg70SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBvz7yBwfGW9JiiJujoCufxzOzNwVDRqClDML0nbuCk=;
 b=xlYc23fejv+osv6t9KyV4cmwRCzwiPqaHWMkyGrgc2ZuUqttOxNbjgoFnny1e53IA50JxCsW8I75Y8eVWl4JFCgEQ4sUsroQafIf9uIpWsjKL3S4D4s+Z7eqFkIAjdgjPabYgDep8eSxUnJMTjTOIbc7Up5hyA6R6QGJWC4u62zq4nYd7B9WizzQtHVwBRjXrMgBRoGsLr5Yjwv6qj2TieYOYylJ6yCZWT2C8yr5Ham3pLBQU9HoB18WRaVmfWbuMWEULNYkWKKhGDemNpyVWe7N9kD0Es7Buqguj1YMjC/gmLOm1CVRCO0NE1SjTvQY8FfUsTJP/3GJA/2NcuFkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBvz7yBwfGW9JiiJujoCufxzOzNwVDRqClDML0nbuCk=;
 b=YGvvM5Dx3y/HNMTXddcIGoc+0G13vJM2eC2KKhPggMib/keD/m8n9xsbcFoQBEi7aUl3endpizjYfRVr7D8DeTLls007nb1YwJm+h4D3V706Sn75dfoT8blRUK7Q9XycLqyi56PUi9sul4gW3xocCq49DvmPBOxCYksQ+mSlgyMCpUaSR7tra7l1jenzvhPTYPmWlc8NbX2ZPMdx22AEvGmX2zxc8Pe+fKoKkvNSBSvCVCHa33xTz+0T6uXnT3iJQ8Pp+ascEw1Cx9JM4tLV6dS0ypxk4pdPIpCoKfuUD0E99Ab7oCBLKi47k9xZNXR5Aud11sm08hivNiQktgjgFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Mon, 10 Aug 2026 22:55:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 22:55:53 +0000
Message-ID: <a4749bb6-736e-4f28-a25c-f3e787152f97@nvidia.com>
Date: Mon, 10 Aug 2026 15:55:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
 <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
 <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>
 <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d462c67-cc46-4edd-5456-08def73287e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vzTWf7x4ihQ7jH0QQBH/LFJFIuY/wus8bx9rmANQAit9gJAIe1ROuGTuM6Ju2UyBEGJkIgSx2RYS3pIJMBsds8puPN3wtQFqcyYK53GJY7L/ip4ppKN2SuZOUHKN57XezDWLuMwSK8sae1MgX4OEhvqAkz+id+vgW8JLMsQGPKkyHFRp4Ziw8wG7gyKw1UMX1n+GsNznmk+cs4/3xIBK2s0nxmEqEbH7LghY/Sa958OfLlgjgvYFEX0zVaHzQPrJTFVNQlzyk3bWnI6WqOHRI1JHUFFSXxDtKwij05820ut75ivvQvONxd6MooT9CC+kxHLXL80YKjk7IW8pjz6m4Em5c7/6v0WSILkBIKK1ihy3x9idBlfSdp2JFm5qWOmm7vJ5RELTDPFy15HH0SRPBWkA0TZN7Ma8aYOMpTqASFeLa7CnFs3D71AqdlgQ/TAL7ehyywBJefuNjNFTMAc93Ne7JOWfdp+4u6fDNdhQbq2Z0gzlVZ0yUN1QN3cUxaPguBVmNA0n14jHfg+GtrKcZoJxTfuCzvOL2b3lrqncykPl3UMJeVlVRX1Tk3NpSraLZeYonjVFE4HmNO5Gp/e5OkfBEudkHHSm8KwtT5gYgaP2ZHgXOB2kGp4kypZBALfYKn3No6y3ueHkERs6AyDUZF5IAM+UXoC9o4X+ojmVGVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUpsL0h2QmFCYWRsRTBWZXZvTnYxRHB1M1dLZnBWRXVQMGR3RzNOMzUzdjRj?=
 =?utf-8?B?YkNyQ2V3SHB4L0d4dXUxRTFMMVJGMzZ3YngwcW11R2FPbkxHMTd5K205OElG?=
 =?utf-8?B?a3E2TXZwY1c4QUs3bmV6c1FBbGg2UU5JRTVpSlRyRjlJeGRmSHd6RU9uemdq?=
 =?utf-8?B?cGNPbjdrTmVwL2JDMDRLMGhuZUFYTnFYVVQxRFgxcXlNcEFoZVl3bUM4OVBD?=
 =?utf-8?B?c3BjNmJMTElTNnZEV3pXcGtWNTdLZWkvTWxaN2xiU3JoT3VxblA1K1luOVMr?=
 =?utf-8?B?YTZPVVBZTSsrOS83dWpnTm5QalQ5ak9JU3FkTFNOcDEzRFp3dDM3SEFaUGhK?=
 =?utf-8?B?bnBPTHVZTjhZUENzNzJiWjRCZC9paHZhRGhQV0ZqMlNLaE9OaE1LU3k0YVJi?=
 =?utf-8?B?WlJHczVaSW1QbDJSSDRtYWY3cFFITnM4MWtuVXRtWHBmV1hiTW5ZMVZFc0lz?=
 =?utf-8?B?aUw5VmxENkQ0RFVPR0NtRy9HUEFhWEh6YXN4aUFtblNvV29sa2dPK3VzV3dE?=
 =?utf-8?B?RmtXWTB6dXVHL1Y4OUpSa3JGS3MrV3BOVjcwUXRQeGRVS2l0eHJQMDNqM05P?=
 =?utf-8?B?NXUyeDBSdVB0QisreUVvY3piTWlwWU5STVpUa1NVS1JEcmZjUlhCbGhYc0Jh?=
 =?utf-8?B?WUIycWg2Q041eS9ybUdvSzRmOEdrNFFDMGZ4VVZPSEZaVzhOTkFBek9JWC80?=
 =?utf-8?B?Z3F6cnh4ejdId2lmeDJ0dkVTZ3Rublo3Yk1rcUZTbG9lZW1WSEJzS2Z4R0VX?=
 =?utf-8?B?b3lqN1pPclRxS1hFMTMxNDFhUVd0eVhqZ0s2VmFYeDRrV0RSZEx6NGZnb3U0?=
 =?utf-8?B?eHNyR2h0OWVjdUh2N0o0UU1lZDBON2cxUnRzbW5hRmQ3Tk5Tc3EzZG1vRGhi?=
 =?utf-8?B?N1YxUXNTRTZBT3p6amFqS24wWTg0bElnTkhMZWtER1ZJUkkzbHh3R1hsQnEx?=
 =?utf-8?B?aENxemNtb0NWeTVFamNEc0FobkJSVWJPMkg2VDlPT1dYcGVjUWhNSk1mTjE2?=
 =?utf-8?B?bDAwbnFQZCsxY3RwbldIVGlsOGhmMWhpNFVjY0M5Y09Qa3V1WlJLVHk1MWxN?=
 =?utf-8?B?YlVXY0JKSXcrTm5hRmwyUHEzeTNBTWV4WldQeFloNE9HK1ptRUV3c0w4ekRT?=
 =?utf-8?B?UW91Ym0xQ0ZoWnMrV2c1cWF0TThoRG1hTWUrUGJMYlIzNFlvWWw3YnluWW9Z?=
 =?utf-8?B?Um9tTDJKakN4bjlITXkvdU9WbmN2bk9oVCt2cHAvaE5xN1V6SHFUYkRYVDAr?=
 =?utf-8?B?SmlRbXN5czliYVR5UElqWjViSVdjYkVKV1k0ZCtHVTF3TlhRVkVNeUNZa3Zw?=
 =?utf-8?B?Z3lkQTJORVZvSXdaamdmeVY4dEIwelh6OEVHdUhOQ1VBQXd2MCtpVDZFTTlZ?=
 =?utf-8?B?UTMyNHpJLzcyOFBNQkJhNHRFWmZPTjErTW1GaHFiYW5wbkxYMFRSVzZkKy83?=
 =?utf-8?B?aDhsTzc3ajNBMzdhdnpFV1hoYytTWVpESVhPRVI5ZFUwdGVBQVVwekZickZx?=
 =?utf-8?B?K09zdS9zQjB5UTRUcmQvcytKNnA2dUE4WVg5VHFFZ3N3Z3I3Vlo1R2I1OTV1?=
 =?utf-8?B?UzFoUEp3c2RxSDhhNmU4YXZlYnFGNDRHRHgwRnBjd2xkcmU2SzBTb1lXZEZU?=
 =?utf-8?B?NzlCeGY2ZmRnUXhNMHM1cU13SVJlY3ViU3FhdXVNaG1ibGJPdkg5VEFXVzRs?=
 =?utf-8?B?Zm56UjNqbTAzUjhUZEE2UXBodG5tV2JDNEpzZTJqTU1Na3VRczVMdnY0N0Fz?=
 =?utf-8?B?Mno2K0xJcEpHTlBUSHBUZWtIK09MUjNpN0xrSmhnZVFvbTZ1dk9POWlaZXBZ?=
 =?utf-8?B?Sk9vb0RZNG5iaFJ6eU5sMmtFL3hqL2VZWnBQTjc5M2Y1bHBIbnpCc0pHQmxT?=
 =?utf-8?B?eFZDY3FJT1JOWWdkOUdJZGFwWnpkZVowK09EZ0g5S21GRUgvZTVsRmpuRlhG?=
 =?utf-8?B?V1N5YzcvajJPaTBNL096MS9uUEZYV3FRNWVnM2hjSEZ2M0t2VjBPUkhTVTFG?=
 =?utf-8?B?cklpNTNHM05HMFp1VEQ2dnVvd0ZCNFhjcUh1dmx1a25zcElhRFlxTDRnb3lV?=
 =?utf-8?B?ZVJRK2h3blBZc0k5L1Mrdm5CMnN5MEVad09lbll1d3o3SmxHS041bmFuRkQ3?=
 =?utf-8?B?L3h0UEJ4Zk9FMndzZkVrWGVSMTB3TlJHNFBpUlpsQmF4OWQ1QlRLYk9IQVhn?=
 =?utf-8?B?ZXVWd1gwK1Z5T0xUU2YzekdOSm1aaWhnc0Rxa2h5ejZaZElNOGwzSVVYaGcv?=
 =?utf-8?B?U2FQWUpOcHJxK25pMitwcXhscTVSWnkxUGFydzdhUnZyaEU4bE1mYVIzMkVP?=
 =?utf-8?B?ZWx3U29vYzNlOFRlU2V4K2prR0M5eXdLajY5MnI1VWFteUprSGFOQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d462c67-cc46-4edd-5456-08def73287e5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 22:55:53.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GDhnmCmgih1mZx00IFPtMQqh2YWn94jA8eu/jeXPUfkrZm/0ktg3MgWThxhFXyOEXc/9T4RHPa+/OTRV/tXXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413

On 8/10/26 3:53 PM, Danilo Krummrich wrote:
> On Sun Aug 9, 2026 at 11:42 PM CEST, John Hubbard wrote:
>> Yes, please. Then my patches 2 and 3 collapse into a single patch that
>> adds count(), irq_type() and an index-to-IrqVector accessor. Or, they go
>> away entirely if you end up putting those on the type yourself.
> 
> I sent out a patch series [1] for this, applied your nova-core patches on top of
> it and resolved the conflicts with the diff below (also pushed a branch in [2]).

Great, I saw that. I'm going to try it out, and review it, asap. 

> 
> Note that I optimized for a clean diff and not for optimal code. I think there
> are more improvements we can make; I will comment on the corresponding patches
> of this series.

ack

> 
> [1] https://lore.kernel.org/all/20260810224800.2314458-1-dakr@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=nova/irq
> 
thanks,
-- 
John Hubbard

