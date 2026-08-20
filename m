Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010055.outbound.protection.outlook.com [52.101.56.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D330FC1D
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787191428; cv=fail; b=hVCaDxe+EFjBU8Q8993ifiBGDH0vTvwW85KUgQ5TpyGQTJ7PTAYJAddn75hZWWpOMg/SEcrF7MQt+qPlVtGv2Ag2NFyABw6Ozaloh00mFlK67vaP/mQ1xSNlCIUu23YW2taEo48JPuyy6nkOlkrqntASX6vWfPDxX9t+kcFQkrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787191428; c=relaxed/simple;
	bh=HSB4GZpKSLTGCeaYB7ScFgqZOP71eAEUPInTyPAKdvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B93uQWn+ejQT5qF9aDqGVADN6QqeMKGWtHvPtrCB1YghIbO3oC8nogqFGF5ziTd2P148nqb/bJgL+3TuDMhgooYcH3WEu5o7lUjMgPkICFZvoG2DMqmxpW3dGh6AcTSZ3nFBUnY01L2RlGJ9h2YlLOx6tpVDyGa6xsVCuLbhCA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bYJp6QOE; arc=fail smtp.client-ip=52.101.56.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYJp6QOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebbdx3nr+knefN7ZPbc/5KvPcMVbS5nqZFkX+9G0FACXXIoylbP5I309XsrezxCnI8ySC0pzsiS4Jx/CgFNsr0rwgDWl+NchhrLYTSdsQ+0vfyO7F5J35lqf1G0VyK6h5FcXaDXx6LqSMWw45Tmro9LpIvzmdrWi4F/yyePYev+58vNDPCHqnKNnISxhiafoKUHQXHLfc7xN/rIDEL9sxIEJRoQLUH/Za0WESmngaP6M2EBWWdwwixftj7T4zy4Y6dSDE+UWyHeIxqP9t2EwAE62CWVVlq9nQzHZu9eKOnZ9tIPgY/omw6SVtfG3vqhZYL/e4alqZxu+C8ZT2N3VZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1DpJZXB2a04GANGzZTp3l+Z1j6L5KSH+19P2605cow=;
 b=BuvjNeov7sZey5mrmBU6qC7sBfGDzNNo4E6RZu5Lib3gMFsQRoRknfFBOOH8RCEc3fHJhv8oL3jUGN+jnV2k+6KhCfqW4d4BcQfxsopMqGtoCdWKdupmHwsrFUM/Kn+gEW+6LLVdv+WuiVJJ4pMLp55HQR8mHkp12XwIwEn61HyLO4G4hADmS+wFPELLn2QfG07ukFAmcRnvrMuOnEoRyrzFM+cwGs4/b0QvsiDP1fwyHSUA0KEf8AIizvliTxHDBjcIjw0r5jW/jtEJ41101+ylklNajp+uqZpRUfudItWFiizGL6RgH2CuLfPf+zdJIQiYVqZvwdLeLUIK70yXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1DpJZXB2a04GANGzZTp3l+Z1j6L5KSH+19P2605cow=;
 b=bYJp6QOEgJylyEJPU7dyR8IRNJaFVt7MbUfzu6Q3SnPNNfluDxAPNDNJoBdZBs4hYQA5Sa1DQdgSlWhVvHNUiR1fspd+iAP2pVp8BYSy2FydwH3DyI0jf29ouT9djd9Z/ZlwXjV4u608NoTTPz7Zj52FL2f+50sWSXgPX+/06mus4FgITygxoz0PGBS72G1NYsstEnP3/DhseGoHyMod0jHPhqLfWa7mX+xkDV/YvwUkP0tSjBq3VuwT3vanqBmdH4JYoUe3amva3mp3RhwAHBlTORP2fZWFPPhKgbTPZSgzdVkoMM4Ne0dJD1opl4CL85sdspscUxwdWpFSILWl4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 02:03:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:03:37 +0000
Message-ID: <153cfc99-f055-422e-8efb-d3a7345408cb@nvidia.com>
Date: Wed, 19 Aug 2026 19:03:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs log
 buffer dumps
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
References: <20260819035221.336390-1-jhubbard@nvidia.com>
 <20260819035221.336390-10-jhubbard@nvidia.com>
 <a1160e753e4514537e322c542930fd0652fcb526.camel@nvidia.com>
 <e94adf18-ae8a-4c09-93a2-fe406b704057@nvidia.com>
 <5b44cb5bf7a1333a168ba9e390fe14cdd46af093.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5b44cb5bf7a1333a168ba9e390fe14cdd46af093.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fd2a9d-841a-4275-8213-08defe5f3f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kouafH6XYoMqfVql8kF3Z5SoXA8j8niuKFFMdAkgN+r8avojQu+lji++xXZPn+OEGbiXD9u4PNJNYEz04EGRlx3yuDHYmwmJ5cDoGG/Gr7e5FOg71q+Jk9zCJduFXFdtor2aMhg3fNM8gff0//yMSV2C16NG+uzX48GoL2SR8TzrLqj2KVUDzh7z2wXMRkJi0UulDeaEUT6nqbdEqkaXerbcr/n398WaXads1zFhiytbSHLqaIWV68hZ328HTl5j8yUyreJRey0IABNOlcBFUb8jdrqh6Y35jNWzQcHxCqpR+KQA3ay7DpGOqQfl+RXuaii3ntusBR+mv4v9v7glRtBocXu/O5PV42e1soF0KP5vUW+rffd5MfbMALnLfNvFwru5W/8aAo7aBu5gdAYIt5ym/wuHjGNf+bORQbnShMkku5ch2B7hETK357jgK37OaHGAWbCdBW8xTKwIN4+3/4kiSwqKToFLqqzvfgj0PrNcGVYuGh0jh6Yp7WGl4ClE+n+/vHJLYzQ9IS8xlQOX716x38EowYVJv628nUOAGLgw0CmxZXCDm9jTp4HlfTcXvdxserGivsmC/3aAW7Oi0QjhF8C3ActdsissIeOLVPRHldAdX/0FcGevlKzJgLCzrmbBop1LobhQqAVYOCu4RVB7RlXrYcURoP7QyF6BU0I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlF3dlFnbzhLcHNkd2dYVnVsMVJQMlFyT1NMcVpxb0RST3V3UVhGU2dvZmE5?=
 =?utf-8?B?dXFyY2Niem5PMmZRSVJ6aXB2dHE0UXZzdmpzK05RbUwxWjBxVVBjTjZEc2kw?=
 =?utf-8?B?S2VwbXBBUFlGN1RKNmkyTEF4cHFWWC9EQW5LSXJzcTN2Q1BJWjNFNHhidjR2?=
 =?utf-8?B?V2dlUXZnendOa20zTjdIQ3VBRVNqZkxXbXVYQ3VBNDZjSjNYS1N3TUgrVEov?=
 =?utf-8?B?ekJuRHZGTXdBa2VrYlUxdWhKMnFYNllGNjNuWHU1NEw2QlFHUFRHMy9GMnhP?=
 =?utf-8?B?TjBlaHEwSEZFVnByTVZuSHlvU2RaQm9UMTR3Q0ZuR1NZUUFESXZIRnJ1cHk1?=
 =?utf-8?B?Um9rZlJtUlludm9BS0xWV0paSFNqYnMyQ3VjeHJRSHBoN2JzZ2RzbE10YnpC?=
 =?utf-8?B?NjBNVVRUTUNoYm1TVEx6UXBtUk1DWUxPRCtjeDBpd0p0VVpUVUkvYkxFMFJl?=
 =?utf-8?B?SUdtN0Jhb2p4d2QwWk5zUHZtYWhqWkpVQ25nS0haa2FFN0xienhVTm1xMFFF?=
 =?utf-8?B?TlJrT2tBMVVlaStZVFVzY05mY0c5VmZlRkx0enV2NGdDVVRKTDg1U29nVEdD?=
 =?utf-8?B?N09Sdnp4NHlBNU93NFFFOTJ0RlpJeGNwT2NYQUdZaGdHYU82T0s4N0M5dFdR?=
 =?utf-8?B?Wk4zWU5kTkRsTWVpRCtOWXZQYVF5NXhSeVJJNGwxa04vbVM4czNuQWNlVzNk?=
 =?utf-8?B?bkJFQmVkY0xGSWFlQWg3anA0UXc2RlpOTUlzMFE4U1VYd1BZdHMrOXdKdkt5?=
 =?utf-8?B?WkpybWgwRVFCNFZFZld3QUx6TE1pb3Yya0tqN3NPNFVwTnZTR1RVMzdURHB2?=
 =?utf-8?B?VnR1alEwYThsVmtrNk95MlByNkkzOG1lVk9pZDQ4ZGpwaytUQnhMelE3TUdm?=
 =?utf-8?B?a2pSR1FiNlFMbWUrNGVkd1IrQ1kyZjZ4RXY4cGtQanpndnZMNS8zNVF6ZmVt?=
 =?utf-8?B?dVUxd0RPaWQ2NCttT1g2cnNJZ2QwZ2EyNW1ZZ284MVZnRmdndmJhMnJhZk9Y?=
 =?utf-8?B?NGpWS1BwOC9DVzIwWEhWVFBjTUZkWTlQZDVwMFZqUWxxdmcveldSOWtTYW9l?=
 =?utf-8?B?VWI5ZE0rTnNycHlkQ0RHdkFUeTJWQmpnWVorU3dmQWhrRHkydXdwM3JYRXJo?=
 =?utf-8?B?cWVWVEw1N0duNVlUMmo5UVdWaTZMUy9BRS9vN0ZRSnNMWlUzZTEycGdEQWNW?=
 =?utf-8?B?NmN2cXl0c01GWExodVZ1ajNsd0RDUkYzdERwK0w0c3I1cjlyUDdvQTd4V0pw?=
 =?utf-8?B?UnI5OU9pRHFDKzBlbWM1bU5GcGxNajNHc0d2QzgvMTRwQVlNVjliWFFyYi9x?=
 =?utf-8?B?b2w2a0wwdEc1OEtkWWYyS21ZaVRPRGZNSjU1eERFdEVlOUNIdXUreUh2TzJu?=
 =?utf-8?B?YmgvRFdudUFxeXM2ZE9vakljc01wSjR4RmZPRjR5ZkZkY0N4TjgzM3RwdEdx?=
 =?utf-8?B?d3pKOUxYZHNpcXlGUVR4Ym9sSklvVGtCWm81RGdkektpOUJuNk9Ob011SjZr?=
 =?utf-8?B?OHh4Tk1YMjJQVG1tNjJGVUx6c3RwZDV4TXpVRW1WRVVvK1NmaldZR2dqaTRN?=
 =?utf-8?B?dDFLZ013eHhWODRDWW5IcUtMYnlQWDdDakt2c0JvaWVPWGJ3V1Jkc0phTkZI?=
 =?utf-8?B?czhqdDZoMVB6NXpJZjJBZXBEU0xUcnp2TE5yTmhvandQbVNKbXNiRUovMHNs?=
 =?utf-8?B?WnpRbmlsT0RFS3RHNHBGYmhtNHZsS0tkRFdMbldiWTBVYXBFNERkS2tEK2V1?=
 =?utf-8?B?RWozNnFkL1lQay8xOGtZSSt4VFBmSkVDN3hkRGFMZE5SSVFaN085TlovRGNM?=
 =?utf-8?B?Q2YwQlU0aWVMb3F1ZmxncjFwdEIySWg2ai9FTzlNTzBuWGdLK3hJRDN3MllV?=
 =?utf-8?B?ZmhHeHg1YVJwYVpSWFJjMDJuTVpqN2lXZWJIU3ZyYW8zR2Noc3RlM2lveUR6?=
 =?utf-8?B?OHpkdDBtNlcxWlAzdDE2L3R0ZGg5dUxlbHRFeTNKcitpVWZGSVZaOGUvczRU?=
 =?utf-8?B?L01RamxwcUs5MVN6b3VDeFQ2Tk1GaytNZlZQYnlEYk9Mc2dtbXRZR2hPVGM1?=
 =?utf-8?B?alpqUUVHNG4xL1dnbFRSZ1BCK1Q2bVk2Tk0yUldQVVlzVk1kV3hMOFNodWE5?=
 =?utf-8?B?YUZzRUFINTlzYWJ0L24rd082S0VBMGtLYkxCbUJScFpJejUxSWhucnJiMjRt?=
 =?utf-8?B?TVVTR1p6TDNISEUzamQ3L2ZmTjNPZnRZTUJTWHRubnY0VlJ4djJ4ZGE0RExh?=
 =?utf-8?B?Q0QrOFBUNlR3dG9sVHY0L1RSRmxZYW9kb0JydmxqOThWRjhUZ0ZPNldyMXlq?=
 =?utf-8?B?c2xJVzNIdWtleXRFQW5EdGhFSjFLdkdmWDZtU2FLazVtYlhEM0FqUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fd2a9d-841a-4275-8213-08defe5f3f69
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:03:37.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q/zydJ4Lfwv/qLlagASVOXTjCGYWHWlbP0aj1nGaV7JQ7ZW0GfSvxDQ8cpneBbvq1OLk3Ab+qvigCkIh2pR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238

On 8/19/26 6:30 PM, Timur Tabi wrote:
> On Wed, 2026-08-19 at 18:00 -0700, John Hubbard wrote:
>>> I'm assuming you want me to change that back?  I didn't realize the build ID was actually
>>> going
>>> to be used by the driver.
>>
>> Well, let's do whatever is best. If you really want/need BLID to be 64 bytes
>> then I can update this series to match.
> 
> You would need to run some ascii_to_hex command on the string to turn it back to 32 bytes, which
> is silly.  I made it 64 bytes because I thought the only use case for it was to display it.

OK, yes, please change it back, then. Having BLID here is of course
incredibly convenient, because we can avoid all kinds of difficulty
in decoding the logs. The decoder really prefers having this, and
then it does the right thing.

I've tested log decoding with this series and it is working nicely,
btw.

thanks,
-- 
John Hubbard

