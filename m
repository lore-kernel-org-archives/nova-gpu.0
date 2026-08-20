Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFD17557E
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187666; cv=fail; b=OjdhOfSn+R/eyQ73nJCJhoLn/t2A8em05Ssl9k7QwKupOuPYy3O65IlkKm5KLatDbMrfyZWQTLZhC2TOhDoiqlOtBgvZflvICScP836QZs9kMmME2IZfGE8KmWBk2r4M2JhseOBJuYO1Hsz/wYFg6iRiV0H7zFujIJXnu3IxW/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187666; c=relaxed/simple;
	bh=CNxC/pMGZX2cmzo0U1yMjj9QWgCuIIRsfOTig2wApaA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TcUlwW73oVNOXPSnsIKfcIR8qgmoIOXdoAyANZenBmOWsoW4o/k3nCgGo+3g33fSagJzeo2n643kyGDNkdYGNgR/7qAMRFu9Sm4ccmwvv4SHiMiyyZ5CNJ5Mt7JoizgulL4vAbXU2Mm6onN51in96u3Beb7/ok2TY1KJP3PzvNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DQ3+gKq5; arc=fail smtp.client-ip=52.101.48.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DQ3+gKq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpyzPHipkLVlhIz8whiX5H2IEGuMafWewRDpfczqHj4U4Hc4PYv6e20Rh6atzliK/L05e6NNX5InVTGw/qRwcXm352CPq988QUaVOQ5vQslRGikDhTq/qLcXbTzfGtdX1VCkX3f/L5k6JIGpnky3hKmohUUt46tpu7HIEErxv7yrbLEHeegZVWC7eNbA2OySDBikm5sI8UBWp2HzOwmi1NNFt4VgA5rW2koBmFNj8dpry8UMStsuvPx8J/gEnG2Ed5Bp2GVEqD73jvOBq7JO/U6F1pFP+wHWw925HNP4G7Iwh+cqR89VjxpXDf+7MyVY7b/tJnJ0GamaXdCURGf/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKSWuZ6um8L2uydwKb7tTdjmMIjgcXOu1SeWo/AzMYs=;
 b=beTYzVZq0HygmCOqjnVMN35wIFmsaj0/ezDG4UmUmvhPm30Vl/sRcc8Gxcr1S3LYV6XDEF6AUwkeu0a2L/FMt11enz1iiUICZPYdeGk9DWGxGMTEKN7E7oYT4dHCQZaha285DOPUxtLtuFcrdLK2zt8l2zuIxeeTGAm1z4x8bZd0MCPRkX4z2rTDTRqL8j6t+v6EfwA9bTbVikVXs3chBG4U62N9OtwPOdkEvYYNRhJDgz7i2R+RPLCHl4mc06/JOQo3ZwOJduWqvBZpmP84exVn0lDtCAJtM1GLhpDaeduK0BCCVDGV/Rc+qxbeeAnat51HzbVb+pdE/HJZM+Cvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKSWuZ6um8L2uydwKb7tTdjmMIjgcXOu1SeWo/AzMYs=;
 b=DQ3+gKq5ibrh7X9xqBfRPkthuK/lLOA6WR9MYB/vAkfWnx3npgpqJVmWYLYQbBxM1Hg6AEWhECfHZm/Pn/NJdP72vxnA979bYc80n8WX8grDzRvb+DglTSsWk6C0Rm0dOpw3Afxzci6F6S5dy3OHw3ksrPO5WI+JnGHwbuy+oOtl9+KbEk8FMmbFZSioLr71XmG7kchlMJD86f3QXeCZ0Qji89QOTGRCWOYZ2+QnnIG7KBXXrUme/PaaSbz1KnR4vTV2mGK/u2bnjGT9DG+oLIj/QcfNGRvqAVW1SuiHt93laOPruC+bGM794J0RWDL2M207XYnRB3SRg1v24kZ46g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 01:00:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 01:00:58 +0000
Message-ID: <e94adf18-ae8a-4c09-93a2-fe406b704057@nvidia.com>
Date: Wed, 19 Aug 2026 18:00:56 -0700
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a1160e753e4514537e322c542930fd0652fcb526.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: a10ca7e3-993e-4007-98cb-08defe567eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GGlrYql4E+PJvYYZj+vfbWhs58I95kYYWkmNpCSExBrCkm4qu3RsewhlV5pbXTvD8FCxsR6rBIPLOXmmtWGDiT3BI9RG1YKrL58yxGuKT8b0jdREezO79C8uKYTbQB7hQZotz2hzOdlK3zTfHa35sWOBrrMEwvEe1kna5GubeUVUl5AOFsSpBXZfW5DIVu6HaYV3ufCOD4HKBLcoItrgECrY/m04SNWGvORe3Km+1bCjbX0Ew6iqr3WufmPknw8QhMVliyMP24ZKanituezYODDe42I9VK3Ol+YkHKZUmxL6E27097RmtgAR1LneP3thxCtihrtiMbJEvAU9xV7opAByPj9u4/4EMu6NRaRzW+UTkt7yj/CbZvTKEBGmKMZmJ0jBi1zLtv/oLSMOlKE7hBQJyImDi4fI1FyuiH5+2eBZEvI8+nXo248aTt8DlDgK5ZhU0N3zFGbXLEz3xvf1UAM3MqxfnHIZlcF9y9MfO2UtdmaQoN+QIKF9RlxtchhHPoA6wOHoQ6q4PAoz+1JhOMbazuQkyxzqiDqwzE8t1q5Dh3iFEZawZrNJuiMgE1NeM5B7QaGhNdcB8QU+nXm7vJS4+O9I+I/TP9a4f9PrAMvldTOtxtVfFgIeo1n0fSXU56wXgj4Djab1WREIpfgjBZ3Fk+tgEaaHXOcZaMOmSDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBRNkw3MXFGRmlXa3FIOTBXRDBxeVZFejMrYXB2cmF5WFVsdnBoeTZFNFRm?=
 =?utf-8?B?VlFXVW9IZXVTWWVCRzJkSjRFM1hLSm9qZW04QmdZQ3RKSUwveEh1TlkwcHla?=
 =?utf-8?B?TUVvRWx5UUE3V3UvMksrc2JzdWY1WXhXUXZMWEdXMEpzWHM4UFVTRXF6bTJs?=
 =?utf-8?B?V2VHQzRTam9CT3RVZ2U2YmhydkhtWEloT0w1NFBWQ2I3OWtWUDM3Qi8rdEVX?=
 =?utf-8?B?L1dhQWdoaHlrQXZpMU9lYzVIMWRxVFVROVkxeVZoeG1VWTZhY0xoeEVYYjNS?=
 =?utf-8?B?QVRZVzVQMjZTMCtqOEJRWDJTckw3SEtpbnRtN0htODhyV0EybFJ6SVpJeU1I?=
 =?utf-8?B?S1NmVWdRNW5vZWJ1NGlubzNHV1JpV3R6RkFUakQzV3ArdWhLandmdFBWbmFw?=
 =?utf-8?B?VmZrL3J1SDNhaXdhZC9JNWFwdHBlYzh3MENqeVN3djgyYmJtVXV5YVNjd3N6?=
 =?utf-8?B?b2N3eUk1MlFmSmMzT2p1QmxLSTJ1Y2ZQZDBQU3YvcDFUcFUzc0QyQmJLMDJE?=
 =?utf-8?B?amxqOUJwaXVseW9HaUhHMkJ3ZWgxMVJxV0tBa1l0QWZ1SUVPOG1acmdLRnhG?=
 =?utf-8?B?YkpJSS9iV05IUmxHV09WMzYrNmxJbkxiSFFENDN6QWFEZG5IWlJjQkpTcndl?=
 =?utf-8?B?Qlk4TVRmenQ3d25TanFsMjJkQ1VuaFAxU2F6bVdGbGJ2OUxWTExNSzdQa3Zv?=
 =?utf-8?B?eW8waERNNStYMnJUU0MwQXFaK3d2cStqM21vYklSMjVFa0c5TEZjUk5raVpW?=
 =?utf-8?B?a1p3TThFbU5xMDlreHBaTC9Va2lNS3NRMk85WXpLalFXeUtqRUk4RmZ6Q0x3?=
 =?utf-8?B?M2JyTzZ2RVUzVDkzYVJhMWxOR0ttV1orZ3M0eXMvR2pjK09wVXd1bHBpblk1?=
 =?utf-8?B?MjdCR1FTTFc5ZE1RbEsxMnFiMzJUYitUeW9MNFhjWXNCZDBleUxRRVZiUmFL?=
 =?utf-8?B?dXRoMk5PeDhWenpUbDBtMU84cGxVOXBWYnJOMXo3RTd0cFdQNUlGOEtGVGtU?=
 =?utf-8?B?V244cWQzbHVYNE5MUWhuSmw0TGc3aEdYYnZYb0J6YUl2OUJ0ckhHTHovMnky?=
 =?utf-8?B?Und6dHZFREh2dDNqUitZOHdBMHUxb1FNOXVGYkh2R2pVdGcxVWZidVpRNHpv?=
 =?utf-8?B?Zjl1QWY4RzRQaG4rWnlWcTdjaWJidm9IalpHTnBKVExuZmdJVFpZSHJ5b3Ay?=
 =?utf-8?B?NHFHQWc4cWh5dVcwRER3a1ZrSHhaV2ZZWWxLeDBVaEVhV1hMMGxtT2kzcTNr?=
 =?utf-8?B?YmoxVEZjeGk1ZlBvS2FtbDBGUG5PTjByQWpBOXBMVFRrM25aQzVDUUtOUkRJ?=
 =?utf-8?B?MGs3NWFlc1JMd2JEMGhYNy9Sa2xKQkZxcjEzcThzMmNNUkFPWnVURkhZUXdF?=
 =?utf-8?B?NGk5dmhETE0yRUhLSWFNVWJTK2NTSERkaEdGTVZaUDB1Y05YdGNEa0lFVm1J?=
 =?utf-8?B?QXFHbTVlejlmbzB3UW8yY1d5OHFjTkJQa1A5WDIvenMxSFozUnhDd3p3MWV6?=
 =?utf-8?B?YUV4RlNSRHk4aVNtYlgwN2tSNFlrSlBYYVhsTERiQmRBRzBiemZPMHhXdlcv?=
 =?utf-8?B?SEpWMDNVTWZtdDBqODdad05nR01jNk56bjcyKzBsV3ByOWJFeExZd0FhTWd4?=
 =?utf-8?B?aEZiVCtLRWZiNzYzSUl1WE9FYTgyN3pLZFl6SW43blA0RTNzdStzUlI0c3VU?=
 =?utf-8?B?bWQ5REIyc1hLVmFQS1BpM2tSTkZwekttdllCVGVuSHVLbFBCUlllVC9Ndkdm?=
 =?utf-8?B?ODZXUW50UFQ4MlgxU2R1dk1EK05NN3dzRVZBUWkvRmR2WWxaQTFERkZOWDUv?=
 =?utf-8?B?K0RXeVpENXgvZ1lIaEhhVDVqVXhESVA4eVFVQ3VsQTQxRmdpVFZ3NDFOTUln?=
 =?utf-8?B?VWVBbEtjcmZXM2VTSEhDenIwZmV4U3hVQVlZbHJqbUdIQ0JUVVpuTCtQbjgz?=
 =?utf-8?B?K3ZlTFFQZ1lCcmFGRHZLdDVBZ1FTRnZGdCtPQVJFbEI5TmtkdkFnR1lnbGEv?=
 =?utf-8?B?Sk84WGlscmRZMnJDcnJOak9Yd1V6MzI0cU1OdExrbXlqMFVQc0tqUFljU0ly?=
 =?utf-8?B?TDZTOWZLaVB3cUwycTlYVE1BOVFHTWJSUUVzVlBGQTRaWFd3aGF4UXVoZDVT?=
 =?utf-8?B?K1ZkV3VydXNtME40cjVRRTJ4dERRQ1VVdXpmejQrZkJKUlRhV3d2dmE4TzhR?=
 =?utf-8?B?T1RQNnFMU2ZQLzlaVE9zRWNnNUx2WkV0dEpjcm1VeUtudnBxS0t6RVgvWStn?=
 =?utf-8?B?T2dPL25haldYMlZXbkVLZzlKWnVYdTZaMUVrUi9IWkJvS1E1TWk5UzRNZkRz?=
 =?utf-8?B?aWJEZ0JZYlpPWVJ6bm1NSkM5WG8wa0dWeHYrWm9aNW5neG1Oa2N5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10ca7e3-993e-4007-98cb-08defe567eba
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:00:58.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boij2OKl3tCXtcBzYiYjQxeuxI89txb8wv1BwTgBqO4U9LEQ/rTQcRP3O3BMJQpnH5Y4IXbS1DHrmK1TqJvsXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072

On 8/19/26 11:20 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
> 
> 
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index dfd41364cc77..e0befe84aa3e 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -31,6 +31,40 @@
>>  pub(crate) mod riscv;
>>  pub(crate) mod tlv;
>>  
>> +/// Maximum length of a build ID, matching Open RM's `BUILD_ID_MAX_LENGTH`.
>> +const BUILD_ID_MAX_LENGTH: usize = 32;
> 
> Um, I recently made a change to the script that expands the build ID from a 32-byte hex 
> 
> [3] tag="BLID" length=20
>   00000000  b5 9b b5 6c 76 7e 1e 34 ef 86 45 c6 73 31 f6 a6  |...lv~.4..E.s1..|
>   00000010  5b 8a 5c 3e                                      |[.\>|
> 
> to a 64-byte string:
> 
> [7] tag="BLID" length=40
>   00000000  39 65 37 64 39 35 66 35 32 62 63 30 36 66 37 63  |9e7d95f52bc06f7c|
>   00000010  66 31 61 34 36 37 37 35 61 64 34 35 30 63 63 63  |f1a46775ad450ccc|
>   00000020  65 66 66 34 35 35 65 34                          |eff455e4|
> 
> I'm assuming you want me to change that back?  I didn't realize the build ID was actually going
> to be used by the driver.

Well, let's do whatever is best. If you really want/need BLID to be 64 bytes
then I can update this series to match.

thanks,
-- 
John Hubbard

