Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15443F1640
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147331; cv=fail; b=kv2jZ9XJHt0QKufl/L1NJ360Msux/sIkZpRYzO3cbBCkFZ/uOZY33aRgiuylAvoXCrh1YcCmuQ/UogL/A/G90AybzOpVfasjZOOIK+HtV5YT8JMoTyzSFYp+3wd5dof0E6tE1VjK2ICfF4zlcoWOeb+78dF4OziH27Zxhu2XUQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147331; c=relaxed/simple;
	bh=c7oIprmHByG4wrZzmMDnpiPGCjHUAEtVLX3ftBwr9fI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CkQegBwe7OkZseD00sfACOLzJtleJRTq00cY8QrJtjZQKeZJMyIRoXQ7oekBsIc7AXJCwzgV9/V9GjCgzqD/GsGKQ6Ha8nRLyOvv+uJrU1uggAn2dgDLksFqS7CKdMYeXAASpH/7b5+HY7MT6NTo4Nw2ug9dX5KMFzpHXLulkzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dItk/4tt; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dItk/4tt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJogVQZc9tzyxZlgN8NjR8N+b9D+XHiAD4VlarfuEvXc9w7f5KCN/O/xk4LUhtPy3Mz++d/lF/a7cynnLgYChxQMuuebH5CC9A9yhj8GIs2jHxAMgtwqB4Emr8HyVD+wcYHJPcquNdFC+yrPX8zYw1zjB820RSEhDId2r7WvoBEoozCw5168k2ATGJzMeayV9dj1U2gM9D8ptMqV1WyzaaBNV9KuNZ/cR9QfPes9XW8/EXAOdgcBjqXOW0PG6kvrI6kE8Hgau9lEipVLOsazRscEcPYGhGlvicYvP0rqoSwYUt0AFcphAkK+YXoMSWg5+EiUJtxiYOwtbVyO++Gg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fek+1hepoSlVKD00cYRUUaHC+amfgbOc3XYelrpHWMk=;
 b=VRQCSBCizffZq4Dw5zY0EIf6lSgT/qmIlOlZAeXKEugSzYDtLu9FogvX7P6gMhn3Tuxo9WlGfsJuxxNa5bnNOuDCua7PECEyh+jxq2IBNnd5nUF5ZN5CAo7VWyk598gpyzStdDBdcobbhN2nhLG4R68L1RL9BdqjWJTsiSwZUrHigrFLu4WZtct1bgs2guOlvejtxMyXuVMbAXvYu14yO5BUOIm54IRMy0ATmRXSRmnIvcnG0Wgm822U/0lzyFZCZknesBePhNY6bdH5aqn4nIf1MC1k0x8G5wZsrbKKYOGBubcYbaGpFgQn1CykfYDmVU7YfinL6MUrBzixleRazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fek+1hepoSlVKD00cYRUUaHC+amfgbOc3XYelrpHWMk=;
 b=dItk/4ttz3ZyZRbQGed8McdriW7e5SSatsQHetMBw4LfXT3FKW5YZrPY3AF9bIREIPuPY4S096LgYMrIHH37xU18GzOm0C+S4QK35k8azsZcGvgoVT5oscvNDk3oWnYeihMzrppuFzdPgoXqKOPAPijPN1X1yTJPPDnR83to+OHOjBDyNi8d0N+ABT8rOTcsW62Z/8UYu6sWHPRwZCV8/u8Z7cNzcdjWBYLoQCW4joKYbIZeVu5eZp7CovvmE6/GZFwFrwL27KvtpzrW1ZpfZGx9So+mvN67OEgyq1BLQZhT5iGL+9hhdZNqtZZiiCJAQBxA7kj9e6HPaaW+yVimZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:15:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:15:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/2] rust: add functions and traits for lossless integer
 conversions
Date: Mon, 27 Jul 2026 19:15:13 +0900
Message-Id: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQrCMBCF4auUWRvJBCuJK+9RioxJamdhKpkSl
 JK7G7t2+T8e3wYSM0eBS7dBjoWFl9QCDx34mdIjKg6twWjTI+qTIrl5klXUmay1hrxGZ6DdXzl
 O/N6pYWw9s6xL/uxywd/6BymoUGnS0fX3YMhN11Q4MB398oSx1voFKPyPkaEAAAA=
X-Change-ID: 20251104-as_casts-6a8882ac0192
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 772fb1ec-6c6f-4df8-294c-08deebc7f7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10070799003|18002099003|10067099003|56012099006|11063799006|921020|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	Tu5E3a5FUgAI39CV2pTvyi8kungvKXdqEVgZyrHgD8o80MnIJOjifwmS6JBcrDHMl70G9vAYk4H3eLVY9qUsgBF2qDP9V4+sFeJ9ZX0zWlNsQRF2mx3HttahZwSuxURsqPYLHzV7iSMrB4NlkbdQpwUEgTi6/IBKrufQvGeRTe8KX8Tt4Xy5LIe92dPWvgTyZ+Uj4OzkuHmVj03vOyIS0Qmrx9iM5AILwSqd7ZNfxBh5fA2uf0ZxiLiYtz+EqO4xiyxSNuEriXSWbdRAXVkYHI4ULQ9tUb31tTYFWHO8NgG/txp6/vcoPi9Naycu8cU1viEcp+DUlpS5VLHKEG2x3+66rNx+yrYekAKx7MdmHPgR3jlVM2SlEJDztrjR5WRdMo4kwoKQXQrraPDwq32ErfFf56zMpLr65rIugW8jruEe9fD8/qgDjlyCfWxWS8Zne3qakGMX38LCC6MdMMoZZaR+T94WeOcV9liFAfMFG+KNJgzJURgyIiOLtaeiNcPWqs7kzc2lwWa3zqpwvsFRZSeGw83dKq5P8sfd/IIitfr9NG6pCORTtHrmlFrCRn4ZReRQ/HuyaX45xtJVSC97jDxopMfyLQfg418fe47Q02Bb5ckt/VDv8tJ8kn3G1hPzVWdzeOvv0Z24JakFxTXUbRS8a9KGAGIs/6zk3LnkCliSNegNF8GhLxvbrNJQnQJj/8Y2Dw85AhyNrVOZ1KjDQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10070799003)(18002099003)(10067099003)(56012099006)(11063799006)(921020)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWlZamVFSm9XSHg1TG5ZcnY2QXBqRzhCbnlhSXVleDNqWHNHbzd5VlFZZU5h?=
 =?utf-8?B?blE4b3BPMmx1NzZWMnZzM2F5Vk9pSG80SUs3YlIwWk9FRXlpbW1LMlV2U2hT?=
 =?utf-8?B?Njh1T0pMS0dwSk5xdnBOTk5iRjJML21TMDR2RFMyRW9NY3ZpUGNJY2E3U1Fl?=
 =?utf-8?B?ZmJnbTNmM0FwMFo3MnNCQkdjdWF4b2hvekR4V05ZWHU0aktIZnEySjNJZzln?=
 =?utf-8?B?MmMvZ1pPd3U1VDZOUHM0aENjK3BaOXdkQ0xHbmlJZmxuVGxmekIwcHhSSUta?=
 =?utf-8?B?SzVlSjRmdXgvelN0NmEwazhaenJaaVVzaU5KRXk2bHV1a0txRzladnIzVzBU?=
 =?utf-8?B?MitaazNTWHNxTk1sWFlZajh5U1g4dEt1OTU5UVk1TVIwcnl3VTVKbDEvVUJt?=
 =?utf-8?B?WDJIbnJSZG1kODVPdldKaThQbzY2RldiTVc3VHNERGNFWTFOcTVRVDRKUUI1?=
 =?utf-8?B?bEd4YmFqWUorQTBMWWhSUEtGOGFUa0hJYWR6WTRBUmE4YVNKMzVaTmEvWW9i?=
 =?utf-8?B?MlMzUHNVQlBoYlFxOXVnM3NPc0lFSDNNd1owai9rSVpTYVN3TndBbXpXZmNQ?=
 =?utf-8?B?c1FiemE2Y0Ztdm1nY1REazY5MWZYUHRVYWwyOFFjS3dxSjNqekdObDMrNFJN?=
 =?utf-8?B?K3ZFeWNRaWsrOUtBOTRMdUFXLzFJdURPa2JsK1UzUk1YbjhZamVZc1JQOUpS?=
 =?utf-8?B?RnptaU9BVWs1bkQ2ODMvNWtCdGpjcndrcTlEQXJ1d0FIQ1pDVk1oMXFXL0lz?=
 =?utf-8?B?Q0F0aGs0UlNTL3d3aVRaVmdGUVF2V0cvU1crWU1pY1A0NklmS0NnYVh0QnZ2?=
 =?utf-8?B?aVJLaW5zQm51T2tGTGUyU0RDcUpjamdzMWFkTnJLTHlRY3NiV0J1V3piVlpL?=
 =?utf-8?B?UG9nV1BveTJ4c3hKcHp3QitoWGsrZ2xGakVDSVpKbkg1ZzVrOXh4Y1poeTBx?=
 =?utf-8?B?ZmVYcEFtUnV1dVNmV29nSUN4cnBqMzVDL2wyR1NYcktjVU9IS2lYK0d1OGxr?=
 =?utf-8?B?Vm5kTDdjUVpLSWlJejVxRjVKcm9QVW5IVXlHdmdTVU9nL1psckdJUldjbnNr?=
 =?utf-8?B?WHNhbE5LOEozWUMwTEJWdDZHdXFtM1lzZnNPQ2x4SW96YXBaOCtZWExGOVVw?=
 =?utf-8?B?Wi9XVDRtYi9mNmlsUG5aN05yaFlQbGdpTkxUM1drZ1dqUEZHS2lLWVl2UFhu?=
 =?utf-8?B?dTlXcVNqNVVkQ3pKUGhHRkNpbnVQY3lWdlB6bVhiUDlqTWhUdkVNZTVsVE4z?=
 =?utf-8?B?a3FhQUNLTXdxY2Fqd3M3YlpTdGxiSjNRczYrcll2SXN5bldJM1BzZ2I0RUZr?=
 =?utf-8?B?LzhUbmZZQXF6WjVuYmtoMFVTakswZkJxMlh5VC8xdjY0c1J6dG5qcDk3RDRY?=
 =?utf-8?B?dmdoT0VoRmhodk44ZVVGMXY5bStLVnJtdnVYMlYzR1VrSXFYUit5Z2ExNkF6?=
 =?utf-8?B?clpVNiswNXZzYklyN1BuemhwV3R6RWZ0dDk3ODArZHE4NTN1bTlsOElDWTk1?=
 =?utf-8?B?ZFNJR3c3Z3JjSm9QaGt2YWNJYUFPMVF1NVpZNXNFdmhlb2tPakp0cmhOZ2VS?=
 =?utf-8?B?VW5wbUJwaWl6R2NUcnhmNDh4K2lzVlZNR0tHZEcwMmhSQmFVK1VIdndNTmJY?=
 =?utf-8?B?K1VOTHM1TlNWMHQvazNQOWFKbWZGSkdzbDNqWXJ0aWJmRTUwL0lPTHg3MDdv?=
 =?utf-8?B?aFZXakxsV0hyVmJoT2drcW1nOXdoL2NtNWQ0bm1lRnRlNnVhODJBVTBtQVF5?=
 =?utf-8?B?bURmTzAvYXhDeC8vWlhaaEYvay9RS3plRmVCOEFMODJnKzlEV00rSWY3eU5Q?=
 =?utf-8?B?WDhyU2I0VUducHVnbUtBak5XZHd5SUFZdTBQQndYTlZYZ0lvVm02UHROTGxz?=
 =?utf-8?B?dHFTcW41K1hQOVpOZEdEMUMvTnMxa21TbktWL0hEUUsxcnVXclpiZkRObEdq?=
 =?utf-8?B?VVV1MnVXV3l4T0xXWitEL3dLa2VMVFR1ZXhTc0d0L2NPN1RocWEyMUdMbldh?=
 =?utf-8?B?Qi9PSWRSL09qakJ5bG1rbW1PU0FtOWNkZ0NkYUU4ZzhUd050WlZjNGdwZGlD?=
 =?utf-8?B?c1pFV0hLR21qZDl0cVAwYVVFYzVhUmlSMXNDcmUrTmtuN1V5STFtWENEMlpR?=
 =?utf-8?B?cU5zSWFUTERweE1BMVZ1di9hMU4vOFAwbGFxa3g5aTNFOVdUclRpTkI5Mmxq?=
 =?utf-8?B?YndTcXhBb2grOGlIV0tzb0tYOTEvVC9MZ3QvN0RCamNlbnFHT0JHWEd3YXRI?=
 =?utf-8?B?NHorY1VHeERIOVdnaHozdUNQbWpJL1Z1MjhScVR3UzIxZmQ5N3NEYk10blVr?=
 =?utf-8?B?RjRoS3lFbzBSMVAvbTl6UklzU04zM3lMRlVmV2YybzlXZ3Y3S1ZuUjlLVXQ2?=
 =?utf-8?Q?sSI7Tjk9IqWewcN4dTTYbvGJGcObeC35ZT/yj9FLW/kV8?=
X-MS-Exchange-AntiSpam-MessageData-1: VG5hvMqSzvz44A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772fb1ec-6c6f-4df8-294c-08deebc7f7f1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:15:22.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfo6pdCdHGr2+UiJY2QEKhbS6bqC4gvtfJYfggg1Sf17FV18+rGRPX7EsUruHCHlgML0qumV2yWtAnGY+O3FwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

This series introduces a copy of the lossless integer conversion
functions/traits of `nova-core` into the `kernel` crate, and makes
`nova-core` use them.

It is way overdue since its RFC [1]; recent dicussions [2] that have
suggested that it might become useful have triggered this posting.

This series is based on `rust-next`.

[1] https://lore.kernel.org/r/20251104-as_casts-v1-1-0a0e95bd2a9f@nvidia.com
[2] https://lore.kernel.org/all/DK82VNBOLWA7.1RFTZQWWNHIEH@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v1:
- Update to latest version in `nova-core`.
- Make `nova-core` use the kernel crate implementation and remove its
  own.
- Link to RFC: https://lore.kernel.org/r/20251104-as_casts-v1-1-0a0e95bd2a9f@nvidia.com

To: Alexandre Courbot <acourbot@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Onur Özkan <work@onurozkan.dev>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: nova-gpu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org

---
Alexandre Courbot (2):
      rust: add functions and traits for lossless integer conversions
      gpu: nova-core: use kernel lossless integer conversion module

 drivers/gpu/nova-core/falcon.rs                    |  10 +-
 drivers/gpu/nova-core/falcon/fsp.rs                |   2 +-
 drivers/gpu/nova-core/fb.rs                        |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs              |   6 +-
 drivers/gpu/nova-core/firmware.rs                  |   8 +-
 drivers/gpu/nova-core/firmware/booter.rs           |  10 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   2 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   2 +-
 drivers/gpu/nova-core/firmware/riscv.rs            |   6 +-
 drivers/gpu/nova-core/fsp.rs                       |   2 +-
 drivers/gpu/nova-core/gsp.rs                       |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |   8 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
 drivers/gpu/nova-core/num.rs                       | 211 ------------------
 drivers/gpu/nova-core/vbios.rs                     |   2 +-
 rust/kernel/num.rs                                 |   3 +
 rust/kernel/num/casts.rs                           | 248 +++++++++++++++++++++
 19 files changed, 286 insertions(+), 246 deletions(-)
---
base-commit: 3dab139d4795f688e4f243e40c7474df00d329d9
change-id: 20251104-as_casts-6a8882ac0192

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

