Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E052E7386
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206324; cv=fail; b=bQQrtlY4C0gNCCapKk22JasjW4KYGCx2HblzpbjfTOWfb7OMJxNtsAWplzdqpP+/jt/AxuMrcFjMcNwbczroq/qk/VCb1Xhn44QP/UaG3hlPsjMZ+uv+UoVhGRz2feZHACW2xiH1rFr+1SMrREVTzOK3PTJc13y0ZRNZ/fH/p64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206324; c=relaxed/simple;
	bh=Nkj1cpfCHtZsZSFT5VIKosyKYv8+sXCrnf6ujLqomzM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mAbQibjFxVY0Q0r6EglVdbuZkp3bv7nKXYCeFIgdoZyTT7bL7dTZ2K9r4x5ya6ngans3sis4/J8vx8fEfPbBt+WlUUeGUPt3BNMgAX02J85+d+cNAg8IzXln5x3XK1uipE0hlYaELncDtJfMs9chI7iPDx648vsr0tXf+FE5NAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aHR9RHl/; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aHR9RHl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmK/XmPKvrCdiUaIS3wWaA5HX+XO/p4NxnulFrX0tNyHS2/qDaTDcLeCMbxKC9RPCiTtd49XhU5hX+9nhGnaJIkTHHkNFtVi+qT9KUBV/wGE6iMZnQYriFqZx/6PuJ0H/yIXgrqHC0SnPvAx/oaB0fK95Zk72RZTHft2IFGf7l2IVb1oVxLNc/UkL14df1/qcnFKk4nxOYw1EeuFj0GrrNbIyU72vxZReDiilP0WLroA5riGGmOzHrhWDYbNDUKjLG6p7BYFSSfrlvDtNga0hQinxxh/WZF1PlEztsPNVZbqg0c/TtFks4BJpTofoZGYR3sv97Vqqq2MZw01yteLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFfra27eVJ8lEYiVrmykRBo3VJks7boEISijVFY570E=;
 b=TXCXmEBhgOYush0j10Ds0WpU2Z3aIQNsi5uBFu7sY09fa3Ql436K7I4pq0O2uaAgaybR4S5AOOeQlErKISoDmgQjBdrX23vGlFyWOuLK1tDGzE2nJbakA5dM9A0LKVi3c0sYn+W5AEmWAixEL1gvXLlSEY8tMhaW6sQNgaaXF/cM6Nzrdb3xfjxnAQ6sPUvUKgb27o/2sMuF4hj/nizSglJAw2KkAXV8DtB9WswNkUzIeye19w4dZKi+q0+9kl17gSbWGYJPxf3KX8N3uaYOjhkae0ZlP/0721oQT6Oy7ivisyr3Zht5/FRMf1YUwLLsjqk2PcFm+3/AXv7PNT45Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFfra27eVJ8lEYiVrmykRBo3VJks7boEISijVFY570E=;
 b=aHR9RHl/wLdXo9r9njgiZRIQpEHCXWf2DD/zBfRLOrzpcdjE6spTgkneu2+PjSSsctkOlieqMHTGsya5h6UC6WwgmGLcOyBDpew2QAWnW0JAvrOhbaB0cSSsyxNKMKyJecXu/RnOauKi6HJchQMbeeBbLxof9qisIgDA6W2AtI4Xj9ElF1CX+jxGmQH5Gg/w2o7/DFbTdtD7dNn/vx7n5QsmFLiMuimDHaRzfIGGUJHGJNNEMtRk0poHYe2RSPEyvsozzFqbVIbD3XmbLnj68JU8KcgnXEWXXuuFBDeXqkiMS+BQ7JOTNSi3WKpYlCkRlqR+R8vVi2fXvIkE7az/kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 19:31:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 19:31:50 +0000
Message-ID: <fb77efd6-1a38-4f81-a493-02268be6bb38@nvidia.com>
Date: Thu, 11 Jun 2026 12:31:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: ce045f8a-9b06-449b-7198-08dec7f015aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+QgqKDDubC8NgtIB7oLy1nE7H4Hsw2kctEhTsshHdiuCI7G22Bs/y9igYEFTSMyhk2NHz/wM1ivmr8Pt5+4HUkIupVoRtlzhb/t5XTxmMNN1aMeEX4qlIMukZChUDC4NlGAfc7baQK/7AvA2X6xgVmxC2SW9HfUp3vHJRFmioy3Hx7dG3mLuKwbTC6XwjKF2uVcPUleszEENL3uc7K5Q/iA6O8rkGYVouGjHl8+izG7IpkyMBdJm2mkfCba4EcWBiQelvj21tbW/LuZvVmE+6Swt+y9VDrH25LqGi6xfsn64yiDaQGjQBK4g/FH/uPKytanTUyGiH1Q+7U5JGV3MgSq7SLTmEltI51BSDWrXgccVl75DCBOu3y1I2M4tXt16nLGQZ1b/0AiVD6/N6Z1r3jwRBWH5O8qgp3HwHgLMuvJx3OK9kdKkXK0Syit7EtRfYhp85zaHj5lc1L8a4WzzLDTVrJ1NY/rjQzw8N2g0vCTOLrYP4bSwCLK7Acjj1aZqy1BtOAfWmpdXcBqxhbbufz2euR3PzsWPUMA7LNhv8jJVau5FXgIrAEPogOrfzzKvn1uwSOFvoZgFn1iZJ3ZyAxDcXoyV23aBwtz5e2v1FLSagwPEe7h4Jo1yc8qSpwEv9C4bm9S/2bIsdvVhObO3gc2X48QztMPZ+o2vOmSMYx23JJVEWRsLMWZ1P9N5oZgO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2VTOU40RWlrV1VjUlBKMDF4WmgxVzdUZ3N0RDRTL1ZmZzRjTm90akN4UTJx?=
 =?utf-8?B?SjlCZy83ZVlUVW9WSzlsakZjOTdhQzI5TGhJM3RkSlJJK3QyQi81UkNuOXBS?=
 =?utf-8?B?Ymd0Mloyc29GNmpQRkRBZ1gyWU8wK09OMW95dFBCK0VCRzFZdHVFbk0vOFM3?=
 =?utf-8?B?Skkrd2N3a3Z2UDdZUktTMWVSUys2UFNIMEl2ckQ0REZkWDJFV1hZSExjZ3g1?=
 =?utf-8?B?aWg1RTFFR2pCVVV4TGtqRkhhZjFtN0Z6dVFFRFBvQXBTcms1OFlFOUEwRVhF?=
 =?utf-8?B?NExNMklIYW4rMjJnVDQrTlhKRHJ3Q3d1czNjLzZ2VXZoMDYwbTJ6WW1mSHZ2?=
 =?utf-8?B?YkpiVmh3UnlyTENYV1F1cnNOTFZDYTJlZmp2R1NaYjMxeHFsdGNtcC82RGFL?=
 =?utf-8?B?R0c5U1VmR3M3L2hXbWhpTlFhTEdRZjh5QVpCZi9zVWFPbEU3cUZLUk4zWlhq?=
 =?utf-8?B?a2lERjBlMzRveTVDc1cxLzRzdi8zeWR5cWZsU25uVVdWQ3hpMG5SUkM0all6?=
 =?utf-8?B?dC9IYjRlZEZuMEY4QlpRU1NwUHU0T1RsOVFaYklJZUJQN2VOU1BaVkRjM0k3?=
 =?utf-8?B?NkViOE5qWDVmeitRWkJ5ME1BTk8vcE5yVytFMWl0bmxoS3lkYnl3QzZBTm9y?=
 =?utf-8?B?ZUM4RExBRFJkSmJqYVNONUwrUVE4ZVNndFptQWwvK3JsU3UzZjI2Z1ovU1NN?=
 =?utf-8?B?Vkk2OFYwR3VTZk11Vk5kMWhhTWk4aHJjczVoN1dEOWROMnBNZ1h1NUtzTnls?=
 =?utf-8?B?cGl5V3FKQnhyQVJWdVI3M21IMUpzaTNWV01yOTVSNFFBeVF6d0tSN3VXeFhv?=
 =?utf-8?B?TTdOWWN4a0FwUytZTlpuNmZNODNOYmZCL0R2WW5ISG5rbTBHeGtOT0xLMDQz?=
 =?utf-8?B?OGk1YTVPditCeWY3bHFkemFwV2Uzb05qTGk2YXJSR3ZtU3F4OXJiYnYzdnBJ?=
 =?utf-8?B?c3J3eDhlUisrY1phSnB0NGVOL3FQbS9GYXkvZ3kzdWRDMU0rUmNPVFR1OXg4?=
 =?utf-8?B?L0pKQXdySTFSZFNyZlgrZFhTWTZDd2o5QVhjUkhXR2Z3RXBiN21CMlh0WU04?=
 =?utf-8?B?ODJSN2JFWlZzNEdLMituSnVYcTRWUXdQZksxclAxbW5UWWI4K0JHYXNaeUJr?=
 =?utf-8?B?b0xOSGc3Vm1qRGhMMTVqWS82alNVMUREdVgyTUZWdVUvMDczdUM0eE5hQzlv?=
 =?utf-8?B?UC9Gajk5dUloZzVvdDFQUXY2Y290UWUwa1ovMmtQdnErVVh3L0F3eDJZUzgw?=
 =?utf-8?B?aEsrN1hwbVpkV2NqWC9zc1p3UHBiNllzLzJmTnVWNHdSU2VoN204WjBWaVJW?=
 =?utf-8?B?VUdNL2RQalZEY2hXYVE3VmhSOFR5QnhrcXpPSjFpK0VZV2JKaW1nSjZDVE9p?=
 =?utf-8?B?WDlULzYzMWV2MzVBRjA4ay9CYjBVKzU5TllyQlV5UzR5S0h4TllIUjFHNElV?=
 =?utf-8?B?SGpQVURUQjI1SEdxOVBrYmdDUktFVWtsY0tUMmVDMjBoR2QzbUt1US9rUDgz?=
 =?utf-8?B?SnNveU1vRGZOT2M0TXA2VDBIWVJGZ0ViL1hpVGFCZHhsKzU0VFZLWTdWSSs5?=
 =?utf-8?B?ckFyTVhLajhhT2VjbXJiQkltSFhldVVQcHlMOVYxNHBZdVgya2FWSG1Hekdm?=
 =?utf-8?B?bnNJcDMrRHNNcS8wUmpCUEd6ZmxZTHZ5djRKTUhiakdUTGpjZEd6c0NZZWg4?=
 =?utf-8?B?RlFlbGdESVdaMER5dVUxQyt2ZVhiVkJlOHlYQnV4QW5zSmNxU1pMNlJCT2dz?=
 =?utf-8?B?SlN5a2lFNW5rbFhRRzV3UEhtYVh0K3hWUlpnLzluclBSODE5bjNoNFdMazVP?=
 =?utf-8?B?OUpnRlp2N2RiUkd4WXZzdENaQjFYY1A2OGFZaXJ6ODZyd3k3ZUFsaHNMdUdi?=
 =?utf-8?B?WHplQVByWVpDM1JyNUhOTVhoV0NpSzZzd0lQOFNxQTFDcUdEMmhyYUp4UEQ3?=
 =?utf-8?B?TGU2WWJwRVlaZzNLSzZkTmlMVk1MdDh5NWtQOFZzZ3dUTkxDM01YMEtxbWdN?=
 =?utf-8?B?cnNXUmhkWG1OcElzSTdub0FqQ25keG53TlFsNnBuaStJUk9sM0FXVGhMdkww?=
 =?utf-8?B?VCtYaFF0LzdveFoxK3pVZkh4NXF0d3g3bE93UlN3VHpyVkFTeEY0M2xGNURC?=
 =?utf-8?B?SXhSck00N0hjZEh0djRvd29MUEI3WjhETmpwaCtQTG5aak1aNW5KWjIwVEww?=
 =?utf-8?B?Rlg2SzNIbjhmWi9CWi9BTGRNYUxESzg5aUlMOG1UbC9rYzNJemRSb3ZvTmxB?=
 =?utf-8?B?OTlTaVZTRmN2Q3FwOXFZUmZBRnRubkJVM1ZnMUpyTm1EWGwwbFM1REZZckRk?=
 =?utf-8?B?VUpyWnkvSlR4cW9OVXNyNVdaekpmKzd5U3VEcVZpUXRvU1hJK2lhdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce045f8a-9b06-449b-7198-08dec7f015aa
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:31:50.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqfIFqWfrNXZOVHrkcXCI1QWoBXENfTCw+eH3tzBCPfU4sdq+wyJFGZU5awPGbpGQy4GoHf+3vTggeRdb8dlDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

On 6/11/26 12:28 PM, Timur Tabi wrote:
> On Thu, 2026-06-11 at 21:18 +0200, Danilo Krummrich wrote:
>>> Sure it can.  It allocated the buffer, and passed a slice of the whole buffer or just a
>>> portion.
>>> After the function returns, the caller can do whatever it wants with the buffer, since it
>>> owns
>>> it outright.
>>
>> True, but there is no reason for the caller to create the sub-slice on its own
>> anymore, i.e. the correct usage becomes the "path of least resistance".
> 
> Is having the caller create the subslice on its own such a big deal?  Given the returned `size`,
> the caller already has all the info it needs.  Most likely, the caller will want to verify
> `size` and still use the original buffer.
> 
> This just seems like another one of those things that Rust make unnecessarily complicated.

Hmmm, interesting. I remain a student of Rust-based design, and am learning
that Rust likes to constrain things early in the call stack (often at
ctor time, even), so that soundness and correctness don't have to be
set up or verified in functions further down.

This is one of those things.

Constraining things so that it is Hard To Do It Wrong is a core theme
of Rust programming, and our experts here are helping guide us into it.

Hope that helps.

thanks,
-- 
John Hubbard

