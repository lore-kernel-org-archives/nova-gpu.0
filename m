Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7B470E8C
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932304; cv=fail; b=uZcFh71qLdZJrJiyGEM4iFyCePK7UOP+u56dH51Y2+Nz/Ble9xl6LkWe4lzpR+e2cz+iKcE5yj+C4XcGUNIH/5s56jeLtpHlikl2Hlbh8McBWrchPyaVAdi36JhwtB7oH6TvVhld49g6GEdipPvabP4QStXhCT6reW8M1ek3iKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932304; c=relaxed/simple;
	bh=+zzePsyL0mXPJpwnVdbpgS0VibPGG/+17Cq5M0KbgaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RjgWstGQ2dPvE+Lc9PBJ3BcueSIyPo9gbd9sPRk4vY2ybvDMu64XT/WtHsRIcQZ05YlmKhdx8OMHzQUhDb2qAEOY6deBlwlPv7by5AtGSU59wDgukBt/bHP7jH9LmVqRJyiRv+zLeIjnW8xJUZgQ1+6MJN3w/5s35z9tX22isBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S8WUuQlj; arc=fail smtp.client-ip=52.101.57.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8WUuQlj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF66wGxjy9g6VGyWZY+NOs7QF1s1VRrmjUVxT4wryTPYRNwinff/xOI/BbczAmEkbrZXU26H4y6+I3ha6rbq324WhKbhcmhJ24hZMf8RrOk2VCxIuWLlJkXA52Z08TtpZkYje/JDxBjVHRHll48pVFjAEjfBybHS7KInbkVFmhU+nJDCqkQvfKTKErY2EMuDMXMtSSIG7fNY0j6zKOZeaf9x+ShQOt2NSXH0z3+KoYDs6H8DBh60R8allmAa19cvG+vA9bYJXPQ/XwivuCP39Kic6otWZ5cpqJUh1zcYrANrCqmaD4HA6jiUA6923sGcR6T47aLVQ5NZ8QuDtztxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCKPkFlOeH04ry6hbwrDvVjjTHkDUKzq3asNRdjBPyI=;
 b=fYgehKcjfJtxsssZGs6B5FSzz8K1fz5636vvQO/2TBO7Cog2gGn34wsZXpJtiTZVBUyTka96ONDECybGf6rmC82rtOHJFW3jhhCyJD19iv7ElJSQwKV86uSpHcxiDZmuhJTQbCE7+10BZtftQ4U5AI43qe3zmTapgPlDtGXRlz+h3mdwWATzKDwxPqSK3OGwJl9NJlCAuRbz8Yo1CNMI/k7axXFzivTzdvBpqJFtoJfdf9vNp2Y1wi+4nI+GtlJTNWbzcJCwg6Cy+rpOjE8sbaKFk4LgIhjEspbVZfTtx//RV38rgIfAHCgrST+Ap6DhgZuQk4OFTYlqQx8jNL80jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCKPkFlOeH04ry6hbwrDvVjjTHkDUKzq3asNRdjBPyI=;
 b=S8WUuQljZP+13xoaqTXacIKnbqXfV23T2LgI++wXmcSmgIirRVS14PZXQdumsuJpjLqSVTIStJWHHtpzFSfoCYBQX2rh0t0vIIKXZqWZOyjiyyR2WXMyRkZOsZFTowFsu4loGxon6pB3IEtmAXRzTEkz4soxqSmH8OLAlWGT1hrWMixS5t7eMHKOByo7eehtTveaefizXw9ayuN7fgC5MUOaB0p1JFnWFnwb5cIesZXCXH/OIThXaUS0yfw8nOk81trg+3tKukUGubMXlpyRS76CFcNzY5tsUptWeb4OyXu5GheIzeKGu8y1F5xnuadnPTnfjPgfVtSfyURSSlr96A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 09:11:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0472.015; Fri, 2 Oct 2026
 09:11:36 +0000
Message-ID: <588ad884-6a81-49a2-b628-1542c3dd78ec@nvidia.com>
Date: Fri, 2 Oct 2026 11:11:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <CAH5fLgiQ=aiF-WWvpPZkB-LcXxfeXAD1Q8zOF3cLQkU072XDKQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAH5fLgiQ=aiF-WWvpPZkB-LcXxfeXAD1Q8zOF3cLQkU072XDKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d6743e-6cb8-4ae5-51b8-08df206528c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|6133799003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QBXxMUBrpXuO3iQcQO7xA6BlXuUjBfyisM3yO7rUOA5OFr70DKRGQxgW5OYlD7GlB6aICOBGX5LQOE6nlwkRy4gJdOuxn6AodZnfLMcaYjEOQksP+kwhCBmSwrUkGx1l14kFRVD06VUYHdRIHy8GYRtd5aW29GPpJeds8qZpqLNmJa7T8dj90mOhNrR+RmoSaJCyYr3toGz10WEErUVozk7UTDc5vXXQem0FLYPbMzcSQKMBYE85ELkWXAiRR8J4E5hukXCViK9dYO9voPGZgLBZS790/5P3XCSQTkDRiVhA3Ql2VVsY6BovQoe02BhBfWJgQ0SQyiifyUrIgWPP4mz/AtXWKm4g5f6w/ERS+RjXFaMs/q+tsFtvq/gQI7w4L77vUdp55jD0r2eE48/AQsXsi/xGeGnzfZXJjMI6sUUGsRFeI+OYQKrRhUkTzpfugF0UcQHGcpmo5dTWxTUoh8kANcUZLhldqhYFIjTPaLAtQe9lEdOiEWw7GtShtC1eEn0RwnsCdViyiTt7uLSB8Smy1X8LIUt3H4VOTzEQfEflXwmGi+wMYOHrivUw+f6VYFjULQoDEmvK5Bf/JDSEwUJm7Y7zY/qbKLFq9hfE41jBmllfWNnYFauxYVdRBSp3t+S60mAHQiOWoKzx5OBGvvAfb3+LZWeA0axAH8tr1SY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlpBZkU2V2ZZRmxMRE5RcVVwb0NEUzBnSW1CZ2lLdStvVi9yblVmWGQvSWw5?=
 =?utf-8?B?V0w2NEZHVi94U0VhVTNZQWFNalRDWkNoS3VoaC9ucHlqOWF3ZlBKa0cyWlBZ?=
 =?utf-8?B?QTkrVVdWODFsa09peGJpZmZzQUkwdUdSSFVoTk5XZXg5MUNiWUl0M1J1NWtu?=
 =?utf-8?B?cGw5RExobjkreGpyT0pibldESEozbVowVHBQRk9JNjJ6UGdaWG92QWpKUGFF?=
 =?utf-8?B?Y2dma2J5dUN4YXNwdmxQNzllc3FlNDlxM3BWZnFsc3pXY1BQL2lHeHpOTkhE?=
 =?utf-8?B?T2g5R2orS3RBM1hZMVNLeTNla1d6VEVaM1NoR0xOTXZaaGwyRnRtMzJuY3M1?=
 =?utf-8?B?Y2Q3cWw5UjFSNHZrdVVjRzBxWVlud25NWjBOQ2dDUjZSYUMzSmduM3FNdHo3?=
 =?utf-8?B?d051N1owNjdXWHpKc3AyRU5XMWZmUUxqYUc3VXpaSVFsZGRRL0pyTW1yMkxL?=
 =?utf-8?B?TjB1S1pSQmdWaERvQXpZeXowbSszUXlFV0pnSThZeG9ERllNWkNXTGw5Zndp?=
 =?utf-8?B?Tkc2K25yRjZtT2ZzL1hWRWZBZ0Q5NjgrQllkYzVtd2tkSFYwWXZwUFdHZkc1?=
 =?utf-8?B?NlNyZGtRaEozaFRLWDFUUkxtbHdUSGJweXQvV1dFRnAzNC9RVDJDWHR6RWJD?=
 =?utf-8?B?RkZFQ3gyR1BSWWZHUDZUZHovQnRMRTNwcmNDZlNnUGptT3hGZmZYMmFSVEhB?=
 =?utf-8?B?SWZKYWVqT29oS09pQkcvdEJ3MXZNako1MFBoWWhZbXk3VVBPVW5ydGRiWEZo?=
 =?utf-8?B?N3dVZ1NjRUNkUEg4L2VSakE3RGZqdTBsWWJseXlTY2ZMSlV5Q3RocXBzTEJ0?=
 =?utf-8?B?SXFaTjRJWUpoa0pSTFduTXlWa1NFc1dDdVB6SzlERzcySWpXV0dXeGJJUUFP?=
 =?utf-8?B?ZUFiN3lWakUwOEFuUm9WSVNWQ3hUQm5MWk42eStMRSs4ODZ4NnpnM1hOTUpO?=
 =?utf-8?B?RlFUUmFGeWpueE16OE1HL0tWY2xvZG1xNnl4WjZvZUxQNkdUUk5adWR4bUVp?=
 =?utf-8?B?YzgwMW5INEFYWllIQkZnZ1BRdTloZEFScjdJSDdhemJZSnlVZEp5SE9xRm9K?=
 =?utf-8?B?dlAwQzFYV3dtaFVxSlZKemQ2by8vazdYZzlKMmdDY0t6MFNBbSs3eisvV2Yx?=
 =?utf-8?B?dUdPaC9KWTE4U295ODBGRjYyeThsbVkyMHp1d25iTU9RcCtEOVNoNTJZY2Ir?=
 =?utf-8?B?TE9PQmtJQkFjZk9vZUl5UkRCWVU0Sm5jR0NIQXNJZHI0aUd3OUs3VTZmM2h2?=
 =?utf-8?B?amwyT2VQZW9rVWlHcEdsZldpb1NscFBXdjg4L1UrSW1zU2ZzMEdtZXBlc0R1?=
 =?utf-8?B?ZkIvY0V2dmNZT0ZpUmVxb2tzaTBFSkU4eElZdjJra3dSQXhpSjdWdnc5N1I0?=
 =?utf-8?B?NXFNQmhoZWh3TlpaN05aeEV6TVlsSjdyWm1YVXAyamsraTFzSDNvbjFId3Fq?=
 =?utf-8?B?ZDJOTFZzVTVsVWF0Ull5d1ZmY0x2WWlSbEFEeEp0SVNaSVozcVdYQVBGbXpy?=
 =?utf-8?B?TFByZEEyd3pQQkp0L0hlOFZwZmxxVGtOUVU2SWlmQ0JSaDRTbklncmJoNWtm?=
 =?utf-8?B?OFExSExhOGdpaXdZYU9iTnNrWmNYdDNuZWliTmhsWFlqSHRpQkNvdXVnbTEz?=
 =?utf-8?B?QTZZRUZXSER3U1dUSDM1WjZQMmYxSGlYTkxRWi9Pek1VLzNvZExxWXF2cVpt?=
 =?utf-8?B?WGpma3RuU0ZyOXhETldIRUorL2JhWDBrQUFMTnhiWlVtZFpQNEhaL3V4SVF5?=
 =?utf-8?B?L2hNdGVkNmZwUSt3cjc3QlU3U2RLamNIRFNka0tFOEVvdE9iQUprUzJKRlpt?=
 =?utf-8?B?NGVCSUNXVGdZaVBTaEY2dTkyOENXVnBQQzBjOG1hRStLeVBWY01hbk10M2Yw?=
 =?utf-8?B?UklHRk10OEhzajZTMEZnUVIrNzExbmU3eVJ2STBINzBaalN5TUt0VEw1MDRJ?=
 =?utf-8?B?T3VlelBkeVVkMWNjMnJKTkhXNklSRzdEdmduQkM1QVg1UkRvVThJWHVBaGZr?=
 =?utf-8?B?MVBtNDduWHJXaGRlSDNIaEI2dDQ0RzRqUmI2aW9kaGhwL0o2WVd0cmtQcG5j?=
 =?utf-8?B?MENCekxScis0Skp0bDFJNHAwaS8vdGVMNkh2MHFPZXJVTHk4S3ZxUjM3VkFF?=
 =?utf-8?B?blRwUGlHSitDVHp3elhiQVlFYW9YSER4QTlKeUd5Mnc0Zzc3YjA1R01qaG5m?=
 =?utf-8?B?ZjNFVnk0NDRENlk2N3BuN1Q2OGRLSkFlaDE5b2VuMEdKRnpHSzZBcFZ3T1JJ?=
 =?utf-8?B?cWJqclVBejFSRGdFdGJrTnB0TEM5NVhYRGR1UXhIVGF6R3hFZWcyZWVvRkNB?=
 =?utf-8?B?QkluVm11Ym1BNThUOUw1ejRzaS9td3diUWRiNVgydi80TnpTRXpMUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d6743e-6cb8-4ae5-51b8-08df206528c0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:11:35.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VITi2nyANHueyQjY/IPNi2IDs8m8Y0PDqHFn2HRvogeI4xPIKrc8zPIP9SSyoXFFi7Bq7H1jVn+QuxMuoIm9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

On 10/2/26 10:21 AM, Alice Ryhl wrote:
> On Wed, Sep 30, 2026 at 5:43 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> A driver that runs an interrupt self-test during probe waits for the
>> handler to fire. wait_for_completion() has no timeout, so a broken
>> interrupt path stalls probe indefinitely. Add a timeout variant of
>> wait_for_completion().
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> [jhubbard: return the remaining jiffies]
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> With the timeout clamped to LONG_MAX as sashiko says:

Clearly Sashiko is improving its Rust-for-Linux review capabilities.
It missed this on the first four revisions of the series, but now
it spotted it. Progress!>
> Acked-by: Alice Ryhl <aliceryhl@google.com>
> 
> Feel free to take through drm-rust-next.

Thanks for the review, Alice!


thanks,
-- 
John Hubbard

