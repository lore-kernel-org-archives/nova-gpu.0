Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325540E8E8
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665692; cv=fail; b=aXHS7asqH449McRVodqBYol/xrwRO7AYEu0ZMYgQWtNdOhEaA4Se5LRFND9LkRwSHN21ubDjAGaVvSC6YYzcyirF6bpmgCzMZ1Yphi2Y/xHAZgdgWpmjbNrEc+6s7aeyyjApLTvUcc2XkcgsFabdaehsehbtYQjjf02VKYQruUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665692; c=relaxed/simple;
	bh=7qQJ1Gln/UQDFTH1LhsSqtLASAh7G4uCiyRWyoppChA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dWXfd9M8lQUGoXtYivu9VUN+tURNw8eyWUeeYxeXN1XRDpT8Lr3A8L/mcyD149brWBZeAidp4Wn3EA1lHMYB2BvmCmzVbh3foop4Zuq7Im9QtlsHpEH3icohwgRvx9WrLefkG8LCni+DHWpmErvKyP9eMTHAKYUwuxMEslR1p1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h2nTzWJ8; arc=fail smtp.client-ip=52.101.57.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h2nTzWJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bv8I81uTsXP+1Jz+PKdIf677xMjlHEjUJhiexj2DPgk3G2qIDsfSnJetsAh+1lfM7nUqcnCat6YhdQKPNV6IiiXguuCwUX5JFFjFzfsxTbxjthhOjd9UcdaMP0ZMyoEL6J3k7jMqXQ3TRZVqrtGRFNgheCCDPhBlG+ohcT4a2a9Fc6KcwIVHOeeB6ySi+JqFTRCtT5EREARu191cK3IrJyPx4mN//M590dwstzMsW8uqcD+wcCshGSieOiNyFOGWmP+KYOZBX7qUwqP3fw6Xsc1YtTlKxzqNtKKDRWNxJrRS6/apRJugdr6tXEAfUdXyqm+B+1Tfew/jDO5zSHnNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qQJ1Gln/UQDFTH1LhsSqtLASAh7G4uCiyRWyoppChA=;
 b=oVEzByylP4BDVEwCflLwenW9FoQnTgMOriEFj6fJl8pVXi53o2U0T8Uj3l4c00tsgAIEpVx+Fh/tFdWuyMlETC4PGGG26wZpjCc4jyY3uHSEWLbyFo8r1xWIqMSRB/GWmssPqpWnOZ0fvNqsGTK+zT5a2bqSvl+PttWhyc/0z8muSXdbdBppbbwuHFIlk09eY9ZoGfDjlCm1zWhG6LdFFcwJXrk4eRfOlAvuncA8tFj2AIMXQ4Kf15+wXaDYinqlyBKu7h4WsBltI0VSCvwsWYNATlBl6F/gB9FbCLn9BO53vtUEE3gKWBr0vNpefj2g2yUtlVV4RoFv+RAn1AYjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qQJ1Gln/UQDFTH1LhsSqtLASAh7G4uCiyRWyoppChA=;
 b=h2nTzWJ8FQkoYRt6sjwGsNS7/m8s9GZpkZvtibare51DTDllmbPWz48xJndEMnUSoRfGJb4qSr0pF3/qjBEQCd/bqUQoWoajwnnQBoclp0gFaIg9rmOPz2PAvdvvhzI4+ranjqt6jyKBu6fH1DlCDS1dsr05Sntrn98Ehh0YQ/3Y/ha9RRqYXgbNUmOPHxzVl5tT2sbUkGeiNEqBwecJtXpA7McM30zk+0MjJXrb9hI2CaCyAZmJxv59h6A7A6ZpDf614+KFBstAZqCRVOBfy97O9omfCN9lvgyRVH6Z140KJxwfv8NWz/+gyeX4yeKkAP6QWkUL1sPC3MvmJo6YdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.8; Fri, 5 Jun 2026 13:21:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 13:21:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 22:21:17 +0900
Message-Id: <DJ15AV6WCPPC.2Q1PMPV193A47@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH 2/9] gpu: nova-core: factor out common FSP message
 header
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-3-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-3-zhiw@nvidia.com>
X-ClientProxiedBy: TY4P286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: cfcc6579-e5f2-4af8-ec97-08dec3055577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ozh6XBBeD7mkSgcKbJzDw73e/sIqQQ5SEq9SlFed6nhrfLgwHJtAQJrP/cTyl1+uXk1GN8XobV/RggXrlzaiXBvHFkG+U/3t1KxYl6KUwnjQU9IcfMHJGIXm1G14yzpNUj/+EoIynyjcGbTJSWSjiicTp9P4ExRR4G6pViwXPKu2AXwTuUj2Wdlcbz4oPkzaQjabUip2V/a5unWKdzc3GTRzZjR5k5CLMwctV0rlLUwPCuS+EVJzh25OuE4OE0MY9HIsUOxQysXt3HgEzRO2E1ldXLivzWRErfLhWoRMM7VqOBUuHNd7tuTh3l839nIVz+TyHCTsvji07hwrbFdVeauOyx/+1HvBSzmed9v4HS/pkqLb3x5PPwFlskteJY8n3cltVN8SsWL17iUWx0oxr01vD9k7PTkhXzbHnJh6x6Nk66Ya7yxqtefB3HqoUKPhrLTkzuiDpeN5ZqiOv/rn7ZFw93j8328VxmcjttUCTGE0xEo5jIdnwvvQaoYwYFnKwYqBoW4xOoEw/ci0CPBKT23zqHcsOJYY539iLnJu4Kfp3ZPNolXxueSD6D1GXJ2ZGKF6HuKRNsE7ufZ+jIHY4QlMIY5sCXdcdu4S5mqeZEoVs8Lk5baHHpImahdNh5QSiPOctV/SSDxnWj/O7Cda9vQOEwjaDcl+sfOZfSQFtpPLGOAoCXZfU+545uXPecZ+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3IzNmgxVHh3R1hOWDY2WGZETElmV2NmL0drd1gzYm4rRW9TTW14RFZURjFQ?=
 =?utf-8?B?S252V3FZb0R1blQvcU1qUVlhaTNFOGxrZU5jZUUrTURJVWZCK0x2WFhxdzdk?=
 =?utf-8?B?eHA0Y0hXTmc2bUFoL1QrMHRtNGQ5eGVzRUljOFhsM1QwRVRsRFJzSk9jbU1X?=
 =?utf-8?B?SU9vNlo4K3NKSmhJR3ZEejBlR1BlcHZMbVFHUEd2N0tyNk9qUG5qdzJjenRI?=
 =?utf-8?B?N25oQWRnbi9PWFN4N1E1MU91NkhvL01kanZmZkZJUm1TMVA1MUtyTnpmOG13?=
 =?utf-8?B?aXBGVGIyNE44cjdleno3dWVhMGoxdzdrUVBNSTM3Sm9lZ1prL3pFcmFYekpG?=
 =?utf-8?B?Z2VDNUFkREJMRjFVNHJGdUhiZmlwTDBiaUlQZzB2R3Bmd0pvRzMrZU0vS0lY?=
 =?utf-8?B?ek5DemM4aE9sekxPRU4vYWJXeDRLODFKVmtyRzcxMG9uTzV3QjNTUEV5YTBK?=
 =?utf-8?B?WVZENWIvZ1EvSWE5Z1EwYWpJZ29lcUt0NzdVL1V6Wm8zMWpxdGgyai9lUnhI?=
 =?utf-8?B?RXlKMVRjY1RLaUFSZW9FUU1qZmdlREdiam91Q1ovck1ZMUxOVU95b1R2M05O?=
 =?utf-8?B?M1NRUE1ZRGswcDNxQ2tHeXMydEN0TTVNSWtjOU5HT1NYTXJqVFExelBkN3RJ?=
 =?utf-8?B?eHRveFg4Q3c1cnAwUFNOYXk4NHMrVlEzZS9CVmNkLzZQTXBJZy92V1dWTFIw?=
 =?utf-8?B?ZGNnNVRrU2o0Umo1NEpRM1NWeEV0M0dCcXlxZWdOSCtNV25qSTB1dUg4YTR2?=
 =?utf-8?B?WDllYmZEVnJWUzNqY2FUZUV4Y3l2K0VDRWJ4SThubDkzQ1pIU2JEWlZPMk9O?=
 =?utf-8?B?dXk4MGQ2MjY4blpzY04rRmorbkhBSGxOaFNYeXdrd1RNUERtaEYyZytkdDhE?=
 =?utf-8?B?d05wK3hmYjNrRDJzYmtRMjl5MnZhQ3Fxd0dlZlAzVmZSSmxENjMveGowSHEw?=
 =?utf-8?B?ZDcyWjFoc21rUFlPNjNvZHRyT1RCckFXeUtialQra0R2ZG4xNktaTTdUOXZ6?=
 =?utf-8?B?clBQbVlMeGhuUFJ4YWlXajVKU3BzV3ZqYmtHNTZwSXlOdVdNZVVvcUN4aUJH?=
 =?utf-8?B?Tms1YUViQzRBN01zTnRKU09lRzVLMUtHa1BUNUVJT2VZSUlCZzdSYnZjL0ZB?=
 =?utf-8?B?SkF6SEoxa3owV25kNjQrZ1hlcUVkcERqcDN1NVVXc2VwT2owajZyYmF6b2xW?=
 =?utf-8?B?K1B4aXhEbjJENXpQamhFUFdHL05MbG11NU13Z1VMRW5IOFdIY0RTMDRHMXVU?=
 =?utf-8?B?ckZUOVdCNHR6VCs1UmxBUEx0V1lUSXhzbnpGb2FOSTRZYUFMWnFIcWN2V3JY?=
 =?utf-8?B?cXMrYW5PWERqNzRmb2o4NjhNQTdEYnlPbFR4TlFKNExQRmhsa0h5WUo4bHh6?=
 =?utf-8?B?aSswSktHUXdQZkFqQ1VjcnVJNitUalF0RzVZWmVVY2U2THFDZU43VDlJYTJ3?=
 =?utf-8?B?NGpnZ2VZSzhUejNHWlRIa0kveHlKaG1sMlcvR1VOVDNZL1NuRkZxaVRCRDlr?=
 =?utf-8?B?d2szR2RRQ1Zqam1rS1dKUmwxM2ZNTlNKRVB5eUg1c2JIYjJtYjFjK0duOVAv?=
 =?utf-8?B?cVlYNy9NK2VsQnFNUDEydi9CeDB2V0l4MGlUYnNqSXZPb3U3RDZQbG9lbk15?=
 =?utf-8?B?QlZIb2kwcHlKcnFzMWdaVHJmeUVKaVhpL0cvaUhtVFRtbVJnMkRRSDBZY1RQ?=
 =?utf-8?B?TnJFK1p4MGtVbi81djQ2YWhocUhvTHJYeDd2dFZwQ3JaU085T05vclVtaExh?=
 =?utf-8?B?RUdtL3VRRXZWQXVjYk4wMjdsN0syNnh5V1JxbmVNdmxpQjBmZTA3KzljSmJu?=
 =?utf-8?B?SXd2VVVNUFBFMG5tbXFvbkxVcGRkVVRtK05JcG5YRjBNYngzQ3BIUG9xV00r?=
 =?utf-8?B?NUZqSG5WSVd6REZNMWdscmJSNmRUcHlGbzNYRU8wQ1J1ZE12UnBlNi9uMlVs?=
 =?utf-8?B?U1BUWUlneGpoZlR2THhVYStaQTI1NmVpOXNCYnE0U211SzU3U0FadUdQdERD?=
 =?utf-8?B?MEdEN3N5Z3ZvUGNSN0RXWmk1dmxUSDlCZTdHajVBTEdmUHlpMHhGOXBtMHhX?=
 =?utf-8?B?aktrREFXU2hraDFyK3VQbW5hVGdkZW16RnVvOGZLNXduK3NFRDVDMUpXSGY5?=
 =?utf-8?B?WGsxTFROSG9BOHlWVUQyS0s3WUVaVm1yNkExaGVzYkRoMVNhb1VWdU8rdG1M?=
 =?utf-8?B?d09vUTZLT245NXBGZ3JTQzNkaEZpUDRXVjhLc2l5S2poZjVtRVZvdDFydmlC?=
 =?utf-8?B?ZHFibm5WOTUweXZDS2NBL2UyL0laaCtGazBUUWFXUG8xcTZqcFZwZDF2bnRO?=
 =?utf-8?B?TXpVZ1MvZHhXR051c2JVTzYxZTAxZ3pxVUlLMHhDNTFkNGZwVHNnbGNFUHZO?=
 =?utf-8?Q?fh72WDtzzd2w9WHNabqmalR0DylIwiTmUmh/n4YAox3z6?=
X-MS-Exchange-AntiSpam-MessageData-1: 8L/KTvlJuBORkA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcc6579-e5f2-4af8-ec97-08dec3055577
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:21:21.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWNb4Z3X3zOsmA2fKTYJY8Uiz9rrYDOkOn7Yd6TWbCH1Ggw8eVxGpu6aVIP6brl0d6bq0UKDQya3VfjzqLBEDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> Extract common MCTP + NVDM headers into FspMessageHeader, rename
> FspMessage to FspCotMessage, and update FspResponse to use the shared
> header. This prepares for adding new FSP message types.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

This patch is a good follow-up to the FSP series irrespective of vGPU
support, so I'd like to merge it rapidly. Leaving it a couple of days
for reviews but I think it makes sense to take it early and avoid
rebasing churn.
