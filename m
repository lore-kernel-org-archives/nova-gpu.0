Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A0BA45
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383031; cv=fail; b=E2Xfd7roUhE88DfvCDGfG4N1hOUCkNasDhMcabvdOr+dlOJd3mzEgZGmRbDAbUNzTbahPea/eo6XTzpgSEu5sF8OYMFW7k//itoLEOn0wyRIVP9PbzkzvbzYPGguNrct9b0uG+0OyapZofSp8VoJObyviD4bk6A3y3C3uKXSmrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383031; c=relaxed/simple;
	bh=sHgxh+pbcn70wYkWkFvMGg6yjzUylfpUFunBVNMfkcs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jWC0c4hLgVzeBnaOT2u7Jq9JJLfjfAfl2UJ3JN1+x7xVosBHWqFJesWEkhQsbQC+A9rMDfzi2Qk3SfK2VhLUFgps0/UCkF250nC/Y969C+k8qLAXl7Az+z5E2cJTq0diYvHHgOtWEjW36IDEU9D9gvQ7uvDrmNZ4fj6MpAJlrLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hMwZeNlU; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hMwZeNlU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/05Zm3KIJ98g8mEBmrmB1H7dcE2JNmJ/gGmM0RaarNsFZPNf2pnsEKxTvkgExr9HqnX4ctIhnKAddpEFf5nHHP8AE/Owzs2t2b8t5ohJTxrk4jAAy3RY8J7GAVJbNi5B9uVSgmjpMwJg8PxUB0NCNelr/09OEdUVhyoZW4f88nSsgI98vC/CnbbUfJ/wmdf0iVVyHZLww0uNVGfMJHUegz3FeS6QXo6XRxJUXnyj6NNEthu8iwnfn0gflTKvEnslx5zIEJQo5r4lHEcSzE1AFXzfph39UDfTVeL00y1MpeCKDSfcfZUxndl5yecz6LkhE4Ds1HmN5Q+Ga0iHkjcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHgxh+pbcn70wYkWkFvMGg6yjzUylfpUFunBVNMfkcs=;
 b=Zs058vOimq5hs0mex1xNdEY0VtoxjAx1YzXuN17NgSXhBEexUoWRTRgZirYZfhdQyfO+Bigmnu7jiAKb1uFUrr5q881naV00bMvwzO8nxH06IYlgvqKE7fFN1eX70PlF2zagZsi1a1j0rqITODo2QXkeT8qo5Vmptm/DfM7J7Ci/ng30w4M2/PdRl56f6bADaRkIdHN5HmZoIsk5cqV6k8JQAODWNUoJVWgX3d+Y6G5TBNr2cabKpuSkorGcUocR1NOI0Ye8TmXVxIYYpfTzbPSjE+47dWkJdCBW7S404pWRBCwSbCn4TDqIbIO2+mxOh2cqu8NBXZKNOMCZyQOVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHgxh+pbcn70wYkWkFvMGg6yjzUylfpUFunBVNMfkcs=;
 b=hMwZeNlU6giu17z2UQt/zmahtYF0yV6CTIHKquC178m3aOIzwTPFTvBAOczwB3OI96j5/812giDYz/nyLhTTeHnrwyXjpEyhOuLzLC/EpA2/gKlsFFSj38e6eK3kEhuG6L8vWphwf5KQMqJUXJTPuKIxKfwWQS0Iz9MeBTeea3ZiQZYJccrujJ9mId4S90j1qRKAaYWU0VDm0Kpe1HRsmq5dQzqh4Pt5HRlY23B6H76CcPx2FiXVdpKZGimJNaU8IwasiBMC3OIGchyi6sCyliFJuQzD3WS//VxprqtxrCY7udDk6IbGqGSkpeuh5YURds/Bfhf5H/wzF8StbRu5gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9624.namprd12.prod.outlook.com (2603:10b6:610:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 06:50:24 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:50:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 15:50:20 +0900
Message-Id: <DIYD3WHIP2BV.1DFYJDFNXPUZX@nvidia.com>
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
Subject: Re: [PATCH v12 10/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon engine stub
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-11-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-11-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 084c8375-c9a8-49dd-d165-08dec07338df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|22082099003|56012099006|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ebxLyeaNjJaNLZHhYv5PRBhy5+3o1vlUr9GfBN5zoqoRfWy1ZZmsJ6qKzvJ+heoMLXqK1ISqy8XzhquTc3BfINfLPX1zoe4erZrCTj4ySoVz8qOC4y6jFpwr3eeHslp2HhXpzZCjSaz6Yo1UZ7cBp1/8i9a1yd95aXzbys6yNNIwGaDAmuth35SPRzqXQybDYAp3cK03fK9dsv2rd6XbmtMSZuhIxD0sv2up+WeVHqXR/dWIlQFT5ZgzjdQhWGYCQzvCn6/oazlvbD48bzl+9mkREqS7VTrm4dNlUcO3a4+G6S/+o/EYBqU630fql3RVtlDMpsUnz4Y3wTf3khXeAzXsTZ29APHPgeoWtSej60K+t3kkvB2gSmJFx0wepHnC0UY76oB71R/Jx0miakrr82SU8HLrtfiMwxuqZJS5HFkzGLR+HflrYrarIlH+j27u5npioVTlO70H1J3aOGLt07CuvEoC/ym3Y3qMpyLa7REYFDg3Y7qflIKt8/U7ytZWB4Xlw2jP3/4pvpZxmSXuJVTc/8snjLgYLlfHBrYsBRCJa/QKMDzbxY9OGF4ISPM65x3J3umcbzhSB3OJdclkRrtS7idZI+P4qRiXdSF3Yth8LWjevdk9ig5OcD77Nid0fKdNRMfAgEa5OFP7X5JhRlamOiV6NNge6umC5M9Etu2gtqNDPJxXyS/slDeIdSy+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(22082099003)(56012099006)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FZYWtsem5kTDdGaXZsczVpaFRZVlhjOHRiUEF5QVg5Q1lNMjJDNUxuRGpk?=
 =?utf-8?B?Umhkc0JybXRwQ1Qva29ndjMrMEVCYkF5YU5hc3hhKzlLNjhHUStKeURZVUFx?=
 =?utf-8?B?cjZvSUxIUTA3UGNnV3hGdGd2UEJFdzJRYlIrS0F2Vkwyb0tIK2ltNUd5Y2ov?=
 =?utf-8?B?T1Z5T04yUTBtaFovQmt5S3p2dzVNUjhkamdEbEVnOHZvaFJLWXp2Y21iNlNQ?=
 =?utf-8?B?VnVsV0FadlhoZFNhbU02Y2hIclN0Vms4Z1lnNFV5UHc0RDdJYTVTNFZlclNn?=
 =?utf-8?B?a1ZDVk9QaU5RcWt3dXdHYTJvK3R1ekhNdW1Eb0hwakI2bmVXN1JNT1Y5empJ?=
 =?utf-8?B?U2hkV0xnYzdPeDIwVlA2Y00yQnhEWnVtaW1NbmJRUDM1aGhrRTlPVUpZZlRG?=
 =?utf-8?B?OWZqUjM3QlJVTnovUEZRQmhtWXcvaXllTVFVeGczaE9id3VCWkJES2VjVG1G?=
 =?utf-8?B?eDJzMnh4dHJMcXlTZm54L1JtYUV2YkZKTERlMG1LU0N2c2lBWUpPT096b281?=
 =?utf-8?B?eDZ1VG5hQnNzNVlsVkg5SS9mekthKzRCQ1N5c0FsWkJ1MlJlZ0VQSWtEV0xx?=
 =?utf-8?B?aGxOUCtDQ1VwSk9SSUIwVUwyaVl0ZjBseDQybGNua0drRE4zM3IzSW5YYnlp?=
 =?utf-8?B?eXUwekNCanh1OUZ0V0RyTWNTeFhRNS9CdXgxQ2NVU3NFeVAwdGZwckpqM3VF?=
 =?utf-8?B?bzZaYXpFR2NXd3VBKzBqRkc2ejlydmhvOEV5V0llUUpnY1JVU1JOMUd2L2Ns?=
 =?utf-8?B?ak92YndLWjBQWHlVUVdSTHlYck9PdXBYTkprSjE2bDRZM0RFZXk0c0o2VXUw?=
 =?utf-8?B?eHlEN0dZNUs2dVQzY1Q3di9xK0RLN2xGSE9RVUdLMXhBenNBbnR5akdpSk1U?=
 =?utf-8?B?cllGWFMyTkJpYXBaOVh4WHhSZkRNbUFYNmhrMnU1aVBmWDNNRWlXZlh6NzJt?=
 =?utf-8?B?N3NCL0dTd1JZTmZJZHZxU0phRmpOR3BCVzNETVpZNU9jRmRoUUg4ZHpxeEI0?=
 =?utf-8?B?YlFxZjNCYjFyYm15L3RRTHpndEQ5c05QeW1wVFlxaUZiTjhEZitJQUJWeE5F?=
 =?utf-8?B?cmwwUjJZSXRkYmZPM1p2Sjk4NGViM2JtYXIyUW01Y3JVYTBQanF2UDZ5ZXZh?=
 =?utf-8?B?UWYwQTVhcUxpZ0xpbC92aEQrcmJ0TEpMT3krVjQzVzBKc1dzMktRZ3o1cmFs?=
 =?utf-8?B?WmVMek03VnVicnZuTWprRTFYSlB6Q3QrVE5DTVk1YmhxSklEWlpkZitaYTF2?=
 =?utf-8?B?OVRRenNZMFgySk93Y0ptdnk5NG1EUzNxYzQ2SW1rbkhxVFNGMDBxZDVjR1ha?=
 =?utf-8?B?ZkFNRFhmcHdwMWFFczZJcDV6bzJQeVY5aWFpY1VYUFBXbndwTndaWk5OQUFY?=
 =?utf-8?B?SGlHOXROSWw1Lyt0VEZFSFJKZEVTRTdrNTE0bENGcUdsMTdLbmp6cFh5Z1dL?=
 =?utf-8?B?bElpcytmYml2TWI4aEVYMzVua3VvL1E0TVdmdXkxUDByTDlNRlh1aDFPNHJj?=
 =?utf-8?B?QjNhVERyVnVFQkN2blFTUHNOV3M2R3dnVjhkeHdiWWNidkpmVE54MkFuRzRF?=
 =?utf-8?B?cGhka3h6NU91b1JCZVF4VXJKUDFYaC9EUGpXUi93SGV4ZnJCNHpYK0ovRjNi?=
 =?utf-8?B?ZURWcHd1aDBBcS9QNGNNZ3JIdTRKTXhxMjkxdTFOTXEzRDBWKzJlQW9qYitI?=
 =?utf-8?B?MUdOY1lid1NDM0h5QW9INnhKclBwR2tqbGxNWFlWeitJNngzSm0zWWNEd09w?=
 =?utf-8?B?K0RTd0dWdDRTdzAwaEJBL2Z6aG1hTkl6SEJPMzlVbmh4NWFlcDV0dDNBQmtX?=
 =?utf-8?B?OWtpTHpOY2dHR2cvQ3JzWHZ5UUpCdWdIME1ZZzRNdUxndUplbUM3amttbFBh?=
 =?utf-8?B?cVd5MVBIWk90VUJsd1pEWFJLdEdZZ2N1R0dMQXFMa2xEdHBJUnpZZTdqelBL?=
 =?utf-8?B?RXhGTmQvdlh1bXBpVVFZWHBlTE1lMGdCREdPN0c1RGxMcldYa081UTdJTE1o?=
 =?utf-8?B?YUQ0SGtXMk1uUDVuNWFxZDdYSk9Jd09CTVFVTUVDSGRXWHVIVDFIRGV0cHBM?=
 =?utf-8?B?S0ZVY0xSVVpqcTJhWi8wZ0JYNUw2a1dHR3pDRnRaQzRtZXYvbENKeE0rUU1E?=
 =?utf-8?B?cU9WcFFvZEZWNWlSSDg1WU8yQ0hxaG91QlJpaXJXMGZ4YnFPWjFRY3pkRHQ0?=
 =?utf-8?B?d1F1OHpxYWtkV3cvOG5XLzNabGR5anhWR0hmaUFOUFJVN2Z5cVRwZGpoeDFx?=
 =?utf-8?B?R1B1eFpPQ3FkTUFRVFkxVWZOd3RUWGFjZlZ1YnM1UDMrUCtPcVRMOVd6ZENw?=
 =?utf-8?B?MnowSFZHZlRMNzJaVFl3eHUvdDZBWnZtQy9VTGtPOGR2ZGFQZXpxM21taVZD?=
 =?utf-8?Q?e3mErpdTpR8pvc0tJG0G1+VzUUZaHjcKYoSakD/041hLG?=
X-MS-Exchange-AntiSpam-MessageData-1: 6txF4mbatnHm7w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084c8375-c9a8-49dd-d165-08dec07338df
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:50:24.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGuszhbTss4Ni46k1ouJb1ielkG/9tIKlq7x0AIbsTYesGVbdXg49a0KaU6V+3f9r2Wa4EZj6Yt5vJgRiQUoDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9624

On Tue Jun 2, 2026 at 12:20 PM JST, John Hubbard wrote:
> Add the FSP (Foundation Security Processor) falcon engine type that
> will handle secure boot and Chain of Trust operations on Hopper and
> Blackwell architectures.
>
> The FSP falcon replaces SEC2's role in the boot sequence for these newer
> architectures. This initial stub just defines the falcon type and its
> base address.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

