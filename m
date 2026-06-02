Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9531DF261
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404943; cv=fail; b=QO10myyHBdkGw9oP6W4NqnYfLBvRqCWT5W/lZ3YonxSIYSyZLhJ2vY3jKoT0pPoHgRdTED6ZLdvwDYeFSVN3vMZWc3JGdElZkOcmphrV7i0wT9KZbqL4fLt9/o3jW6Anr5+KYPJVWyqZLx6yrMj+5tAhvIAVSDgWHEK2856BOpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404943; c=relaxed/simple;
	bh=G7D2SBpN0mwcqqLOiY9X5FEV8qyXev1vPkMJFZaKGxQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=C+k9mvWaCEKyoPPA8mL1h1JNiCAupwIPqbodr9k2sDEtKndzjmnD9yHVioOhvTUrz8FHYgsSpMX68IYwVJAd3HdtsC+UCRzSpvB5iRTL4uzdHVkgQVv7QLQh4S1SCjj6dRl8IqLprjZDMG4bdy1o9VHgvy56GI0WU0BPmNMd79w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dxweetxr; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dxweetxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4Rk5b1AH4QYYdmFO3VEmdMbm4AdxTRPI8sY+sJTZa+a54cblcB5Hlz9Y6G051R+NAbR1BMrbIwLqEXAgnQzPVI55o8a1zGUEmvrZQQw78ocfajOTq5Tp8JeAZNQ+8LMdgSogs1OXDAwY0OmOXeZcQiVRrNQCg4IzqZT1IFB0fp9WxDL46QglCvy9XnHCn6TxjWK9fpnf8pXLLU+Xyvk28ZrIu5SaJvW6r/zoZT8Kdc2VTTgal6NPNhbm+5/6cEaetw04PYm8CG3B9nF7P2DaDeVEc2Gt68KnDRHXsZ6EKHfGFSG9JSDtZ0ZkUFYK/h2wAfk2VVAQ6nvHa+y+A7XOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7D2SBpN0mwcqqLOiY9X5FEV8qyXev1vPkMJFZaKGxQ=;
 b=pu+QGYZhcVIW5wtJYhMLB8/v5KW+8YKiZfXAO+HBU1vu3z0NHfn+J9ETlem9FbWI8IMIFoKT65jcokMSSuIxSCDMfLbThXDbWX2Y5xAXFQteJIU0zk7AT9WYf1923M+iTHyeV+keVuLtzLwoVpFqMa70aBo4pkoOY+sLC2EAgBA12lkurxr6YwazubknTA6XLMvfa6XCZobXjI+BtcX8wfBr+nLlChVYRbnaKKSUk2IVXW/wzkfzmDdFg15krbUhsfP+cFoglPrJlqhOCgoBKtG4VghyhPvQMxeKOZSAE9qaoARbH1NfrWgXjZqvNR+B9qlK5GNUEAtqEhwDJITzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7D2SBpN0mwcqqLOiY9X5FEV8qyXev1vPkMJFZaKGxQ=;
 b=dxweetxr4Wrg8pjEJheUtsaJ54yEFP0jxucO3zzQbW9Y3YT1lU4kTD19rMh/guRadC36yTwAaC2N+Jrk7hiqd8OuzFKTqg4Cwzl1vtKYZMCusYwnNnKBhRPtNQbz7m5pq5JgqkfryfvNN5OXIZgDjqrkBI6Gogg5LJ3dDQfo8zQ6GshROL4uMZhhJWhpmNSZEvauYPbpjVyCfaZolGO7XSMdPVMCXJmhMt1m9uVFqUz0EmPBBgQIc2yYQSIc9wgXnD9ODToCqtFqlZloWlkIIPoHbTzRe2BldyFhKkrkmF0bEZNmFzrF69vx8aZiiMgh0Pvyd3WkYBZ1t+8TNcLvQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 12:55:35 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 12:55:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 21:55:32 +0900
Message-Id: <DIYKVIVIQ729.1R6M2LDUOP1N5@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 18/22] gpu: nova-core: Hopper/Blackwell: select FSP
 Chain of Trust version
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-19-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-19-jhubbard@nvidia.com>
X-ClientProxiedBy: DSSP221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea6277c-4275-49b7-7341-08dec0a63d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YCP677Xe1f4sA6ILdW2qQoFNg5DtgAXtpAAnMNzt45/dR0CI6h0pFYmp9NjZQV8B9CVBQTm+Zf72cSvTHzX7x5c8aO0F7Q6iBMYsqELO6zD+40MfBTfjpsk9CxFnTZqYG2rKqU2pove47AsZg942pzrY3xXI7rMBshuZ7pYOhQbK/alXuvD8vc4g0G5LMv9i+Mu/6xtDRep/1wsLyjwfZsVfVyNGRAA+I6hhEpluD7BcVyc4TVAMFnIeALsd6+iY+2tMep/XbOJs2ghZswqCy4ot9UtPNZEOv++tVbJVCAQSgnGcJg8F5VR5Q0ogjDF7vJUM7SO8TVgs2gcuRJgy1AI1ibBEzf60gdQJPYe+ApsoqlFdKDQUP8KXW4JnHrMwW0REIgjD2UnRUbylDQyBZQMNTr5BIa6FK7mWP4jxmXm6VAMDhYq40zzF5S3xG9TJT+chT8BUaGmkSNYW1mJVipFp7lrYfAeRvsvrkO4r/SLlI8qLwsk4yZkYDA+xFoTdDf5qzhR9qSGevCBA63v4J87BOtjkGY7KdZcJCgqVImxkZFri6fXnEeTSv4TVK1rFqjt81ekMrhvMtyXq7EtHuurRV4HYL7jsX3IxJ9kgUg76TFtg2E7Qt8RhRJkJqKuAj/scslqKIqJaT+hY/Y6FTrMLohRloXfpljzc8xfV0zh8vY8EevyjfugtI1glQnU1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlF2Q3BDK2pReU9ObThsOGdzdzhob2VobXdhOHkveGRUOTI4NlJDeUR0N3lY?=
 =?utf-8?B?M3ZSN2FGQ2IzNE9wemM2alNVS05nUlpSZXhSdmN5ODcydWJYN0M5L2U5NnRD?=
 =?utf-8?B?UGs4dkwrRTBXdVQ4eDArVWg0UU43OFFUaUVNZG9TMGo3cXBkNCtkM0hKVlJ0?=
 =?utf-8?B?ZHlTaVMzeEVLRytxaDVDZkZzalhlakxLN3RqYmd5QUcxQ0dsTXlBRmpmVUVS?=
 =?utf-8?B?ZzlpL1M4UG1uVVM2MkQzMEZNYmN3WTBvbmJKSGFhTVNLTXZ5cjhNVXlKc2xS?=
 =?utf-8?B?bU40U0o1TjQwb0I4dmpZZVlXNU1IUmFzQ0tDRU1pSEpKMUsxTFJ3UDFwU1dC?=
 =?utf-8?B?T3o2OE85MW0rM2FYM1JRVmtJVWtZdTJ6Y1lXY3ZyR3JIVmMyS0gwb3o5YnJJ?=
 =?utf-8?B?Y294aEVJS2MvNG5zSDdOWGhpVVROYWpudkxVUkJVcjU4UDhaTmMvLzg5enBq?=
 =?utf-8?B?ZlRLemE3ZmZNMC9WSnppNUE5QkYrRkZmaktPN2JDaUpLVWU2YUIybHJISzY2?=
 =?utf-8?B?clN3ekF3MmtGcmR5WTcwY2xKM2swOFpEaWtCQktkMkFwcyt2ZXBQYnJpdmoz?=
 =?utf-8?B?NDBvdEI0d1Q5dEJ6SThKTFhMSTg5Z2k4QkdwaU5VbXFRa0N2QThKMnF3Zkll?=
 =?utf-8?B?WGVsaEtQZ2ZHaTA1QnQ0OTN0eVUyRnJPUnNsQ3VUV2I5T1NtZzQ4ZTVUUy96?=
 =?utf-8?B?KzVWdGVaQlVpT3lSZk9yQXpnblNlZlpReHNML0k1Y2Znd1FxdTBUUGNPdTJX?=
 =?utf-8?B?cTUvL0RrRlFhV2VORDcyVjNWdmdocmxMRzdsamRlZEp6M1BHR0dUTlVMbmQ2?=
 =?utf-8?B?b3ZqWnVXbXk0MGpzSklXUmhyL0JLRlZQekJYakF5NUpORzh0YlFab1RFZXll?=
 =?utf-8?B?VnVSYjZiam95bTNFc0hmWEZ5bVB3RG9SMCt5a1BqQ2QwMEJTWU1SMFljNjNH?=
 =?utf-8?B?YkZxc041RmxvR2dpaFNjNy9yK1FqNDZjbmZOUHVIZWhPMnVuS2N0OUFyQTFi?=
 =?utf-8?B?UzN0UWdyZGRUak5EQ0JaWGdmMkY3bXg2ejFkdHoxK0I5OVo0cnYyTm1ndDky?=
 =?utf-8?B?b3lXc2NKR1N4Q3FpUDFwVTNSU240M1VqMUM5MDgvcHBtTnVyYmRCakRPdHI0?=
 =?utf-8?B?MHBkcFkrZ1JCZVBzMkQ0L2x4VVNHTUNibXpKaEVzNUhFbHVDZDhSWUNxZHZ5?=
 =?utf-8?B?YW9FeFBhOHdqUGx5ZjQrTUJXN1lyM0tTNVZwNTJWRzVENUE5NUM0Q2ZNMHln?=
 =?utf-8?B?YTR5V3MrdllMLzh2bkNDNTcwVXBwSE5sVGtFdzFvZnBjbmIyMTdnaS93NXNk?=
 =?utf-8?B?MmRjNmc2OERNK1dmSmVPbnVvV1hocFBZTEhiZ0VEY041RGw5bXFqcU5Vbk9h?=
 =?utf-8?B?VnVQSDRjR0xjVFUyNXZ1Y3VvWjBGK2ZLbFRIVmh4T0FqblQ3ZTMrN3E1ZXlU?=
 =?utf-8?B?ZklZTjNiSld0YU1WTHArOWczcmQwdHBWNVpkTHBWd0N0RlFib25CWkJOYjIw?=
 =?utf-8?B?djk0OU5IeU40dVp3eUtucVpDWTFHb2NodXg1VEZLaEtXNmZleVN1MTBaUkNO?=
 =?utf-8?B?MkU1V2dNVzRzeDErMUVKajQrS2NtaU1neHIrc2pmbmpzUklVZi9CVXI1andL?=
 =?utf-8?B?Tmt6cndudjc5L0oyQlQ1ZldYQVY2V2k4TjBQV2ZJMEQ1WmJaYWxTekI0azFs?=
 =?utf-8?B?cmthcGlOd1J0eFhIdXMzOEpyNFFFV0x5bVFaUFJEeUgzWUJsVStONEpKRXpW?=
 =?utf-8?B?bEhxVGhZbm5qMitZbXUxUTYwQWhDQk03ck8xRTZxb3dSd2tYbzRXWlkzSXUv?=
 =?utf-8?B?REE3b0lCQk5tdzhPRUZRbUwydGRmSjgzcTFVQVFmSTEzeFZFSEJuVmdjNjVh?=
 =?utf-8?B?b2ZXOW9wRWVBdksyd01UalVVL1lWRDR4YlFVUzB3K2svcHFaNldmeGNSZGU0?=
 =?utf-8?B?WHBDbmFIM1VXOE9JanN5SjVFQTZqclV1cHk0eDMyZTNQc1AxempQSWx5VlVY?=
 =?utf-8?B?eE5EMGFXNGFpQjdFbi80UXY3dWYvdFJVSzdyR0x3Rlh2YW53R1Rjellwa1FR?=
 =?utf-8?B?SFk3OU1hRDNFQVlud09iR1hDdWdLbjdiWGI2MlN6NXlxWm9tMGVhbmFndllX?=
 =?utf-8?B?c2RodmtmWXd1VittdXp6R2dpU3NOc2ZCZVh3bmcwSTRxSEpwZW1yYWVtbTRu?=
 =?utf-8?B?eWNvbVBVQ2RMU253ZGN5dWRPZGkzYTM1b3R5bzJpWEdibHNMdDJEMkRpazh1?=
 =?utf-8?B?OXg4QlpBRXNoaG5aWUdiYXdxWXdmOU1xdk5oYmZ4MDhBUS9CR205UGw5OGEz?=
 =?utf-8?B?VSthMHNOMlI5eC9xSzQvYTBDWE53dGV6QTAxdnlJOWVYV25CU0hpb0xTQzk0?=
 =?utf-8?Q?/9NFLg0nQ/iF+nGvr2Qr6CWrnI0XdosVKHcMhJjpAjtVq?=
X-MS-Exchange-AntiSpam-MessageData-1: 5CvkS5GvQWm37Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea6277c-4275-49b7-7341-08dec0a63d22
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:55:35.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IspejqANZxKCEevoUgE1bEWRV/yZSfH7x2ucxYVKc8YNLEeKwe/fiHGozybxVhrypT8l0tuOLEcgb+2ZIeONBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> The FSP Chain of Trust handshake is versioned: Hopper speaks version 1
> and Blackwell speaks version 2. Provide the version through the FSP HAL
> so the boot message carries the value FSP expects, and so chipsets that
> do not use FSP need not express a version at all.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
