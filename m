Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78129C328
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 04:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781237070; cv=fail; b=cA7k6fk+3f5v2SVJDu7sabKYwXJUqgDusWx1QVD0OcD6Mmd4pdCbM4aOkxuFF9ZpdIhM06bX5THpkAhYWwvRcmTxSj+kPOuu58l3TT0FqFLSrNZmxPe33qYh1l6vzoCiPRQrICdBAukoroSr/1hQjzObN+a4vvcVxRt4BUrgZSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781237070; c=relaxed/simple;
	bh=Ka2bw9XLZZfoiDEA0ldminNfatzoDD5dSddgaOkntPE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EXRAlgoFyEuAIY6ID6HhllxHIqLaNG5yeL8ClSllu65yYeBIKx+FRieM9TCdlzPigqJ5P1OAzxs4HUhnswJRsa6nm7tlQ8dA08EFu4OV2x3pgXwislC6/LTr/vs6XwHKLs55C3aCu/aF1fYWIs93A3PNP22JAjdn2W6tZNivTrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k2D55wt7; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k2D55wt7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUd4V1nXTunFGgOqBJ6IVsl1WMXLjBt1py6Y0D/gBoyVvdNMMO84cOnGAOOyMvw4zsiuWsvGAUsIE4jgRMIQZm7I1VBQ6Xzf7sP6lvdw72i8sWFYLdhucnn3oExKtMarNjI0QmMtDhqr5nivR9ezYPFmEws6J/LSC7Y515aYMvAY9C4NPKcX2bfKQ1mkqBRzRQOdlKzwQcrBpRj6FzRSlkrPqRjMn2ZBB2CxU47xGQMe32OszETIgUTaewvFqAz0Cd3X0POYpUAuOlQrE/9X54U9s/9v6/AyH+JRL6SHHZ8+BEiTGUuYe2ViJ7k6FB5+OGx6/XOPrhImdxt3gd1mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MU11CWs71LYuxIaM9L4gQwjdk8zzh5d0nJaLGD2kPY=;
 b=YBEw7CO7P8LaZV91m03CuJ0Il4fNOGnHcAnF/yNKQ8gAQnRT2YnNcF0975hl31U4wohgcjhYW4QsA52FiAplj85tmA+9K9QiCZfK1M72gggX0U0XPzaJGpkT796UBEO01MScbQMCYUbI1v3i8Zycp+Q1q50jnbWrvsdOeNAONN0YyEuMApG2oCeLmSCp/YrGP6wneaPUhy/ZLL5MFi29tr3LuJh4KNM3stAm6fiFzT0XmNj9tWg4r29f8fnRem7tzOm/SAq3EJq1Rayx2nugay4jlsrDSk2t/UR/HtRveWK/7+wvM69oBsSPMkryeOQTzWteHTlM6l6MmHm4e1skZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MU11CWs71LYuxIaM9L4gQwjdk8zzh5d0nJaLGD2kPY=;
 b=k2D55wt7SYK+9yoDbXIX72pbW/sYYHnh+r9O4s/ouVVa06jsV2HPbB2XNk/f8qKJbyXCzdI5n0tzg4Gwnk4Yi1BKbQqNcMJCNW5X9FAngxs42o3jirFC2y/98pXFvAayv9zxDxkM2MNoz5MRj71nv+t4QQQFeltYOATrqwI44lgEKcJI0jK4NPNbTWnTk8s6F9nd54p7fRddu+aUD3sO/YFVZO6V3jOBPrE5IfFGPJu7yh9659QXRf9x1+5kY6ZqXvgcOEdcQ9owa7TMNd9ZF5JL8JuL3Ad951DH+YkF3AqYbzzmotiFSrLCf0Gb4mKL+5eIah6FWMRNT40mak/51w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 04:04:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 04:04:25 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset table
Date: Thu, 11 Jun 2026 21:04:20 -0700
Message-ID: <20260612040420.121499-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd6f26c-fa37-413f-7b9d-08dec837b0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p07SIRG0xQlrBe3VwoTbvM0+E1Zqi+RsWVkbfEb/XK2uhQYhEu/wu6aW2zaL+y3DNCXuhthNmXrcBgnes8vBFRPZOQbWtm/erRiXsexaRFPPLs/i7PRHHukpaS4RMMVM0egrnuY1w6v049vaw5XhMSdRns626JhtGel1cYgm1Q/TkKaBQElNW2q1SZPFWTmJScTq3SppCieGnr72uC9T82qqpjxm1snZhhFexx7jV2Skq4FpWrQX6QquEECLpJv1qAbePc+zAxZYIXebEQLraPuzH60k3S4JS2TWT21keK5beLCNeo0YnFjVrKWvphwzazFoXwy9NB6fPnK+3RiWjPc/DaOSezJUvdSnuxmqhqjG5MFNwTv0o3SQ6KnfvmIyyZ9OnmRdLlsGOykSKYvP98jogckU+abyJkH4ltWFed78em1BVSYE0D7pQZ+wdVPfDcGfDxuHH00qOr7qkdXFu2xp2OFI2NJG3an3o/EpHBrh4xMmr5Mq9tWoK2dGGXwqQZd/UgiWi5+SZYnV8Kp698mB7vdz/lQBjfV5fbc8o5zqHzJfyRZmCWO9ZApPVd7rx78qRTllcq7evvy1XUQ2zi6dQBZHORvz6BdKE2Xt6ccfEeD1QQJlUBY7eTHklEeCuqe8Y+2pr+2LvUZPwskdojExjISo3tZaly1/8Fe8Uw/TqMxBa3lGrQRdJnGGPvARNxq5sJc8evKkZ5GCO5ZhAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GnQ2gRGBe6FChON3L8g576itGch4B1CgQDmkdqaNSjeOeIEsYV9NtTyPDEql?=
 =?us-ascii?Q?NCIIMM2mCUa/dfEV4mabwHJue7TZbzxfEAezP2psyxWneeRG2ukGL1laxcok?=
 =?us-ascii?Q?gP5dPFG6kuNet6iapcTlpu2SDYrncPQiNfeVkplIlYqNWZiqzQSRpOl4Mehs?=
 =?us-ascii?Q?+lgFsbx/dL2pnHc7u9Kfzojq19IK6dSEIVkYqgiB+/2b4hkMyWWpNNB5ceAE?=
 =?us-ascii?Q?Nr++kf5m4LaQEhvY7qf609jvweFExeb0V5QNgYaukUN9EY2EjQTqwlpks73e?=
 =?us-ascii?Q?bg9BVDvCg6O5K3YXniErDSwsEVtRxqBlzy2xpx6/9xmqVbH0AvIGpO8Ajy8K?=
 =?us-ascii?Q?7QMobbRSPrGVQicqCRvXlDiENEi3crt60W9hTd0yWFQVQLirJSAf40vPe5W1?=
 =?us-ascii?Q?pvovMRB6rluCkD9xNueQ3Ce1m8XSscNF8bAY/PBwblC2GCf5XcG3X17naVqh?=
 =?us-ascii?Q?lhqYh7V4bU4bcrdcWbFYqn11gkHiDmb2JQJOCyBH6Z8kZxQzcGZdrxWiow4D?=
 =?us-ascii?Q?2UzKf1/nHO0kjL4676fqUhaLyZm59oqbdtxCxZ30XSVeLGk29yqvky+xg3sD?=
 =?us-ascii?Q?rD4crJhKIRIfqVYw+WyWgFH+2DcLfEyonmImuB2TTFeKVos8YT0wXSdqayvP?=
 =?us-ascii?Q?P4mCM4LX+296El4ngN5rWaX+ew98BFnAgAD0BE4e/d1mKOxOCZ+yIxktSUPe?=
 =?us-ascii?Q?er7/br98ZLxoK8f3r0wC1J0g2XNaq5+lE/RmRsiAn/M8r/FCBlqVtSLnfxIc?=
 =?us-ascii?Q?QiiavxbWr37GZC0/0RsYx7cpOfk4yELR2WRRIn4mbV4smURy8pfv6yb4A2yz?=
 =?us-ascii?Q?2oOnMiFER3swgHsJnFhVN481gbJwscRwC1QEufXe09ZQ4P/WVATvwZud0vFx?=
 =?us-ascii?Q?Ng3nSHWNAcItXeqq2ENk/L+Wdqyo5YrtIwCHNJb023lXUoKOkgJB50+4UiTH?=
 =?us-ascii?Q?7nzxwqB+VBwoWt66Rg3RBTRf3OTjI/7u2q6pP17JtIo0ho9GtKOt/mQQVCuc?=
 =?us-ascii?Q?/NjJ5RZJtvbqzzbkGwuqYn6LHHgSyMQtd4Xo05kj8ocoIZArN/AjAwupBWgl?=
 =?us-ascii?Q?HDwytmgZf2/uhboaoWGd2rR1Szem7lmBYT8tivgfnXm9WGDJVEumA7QuOWAt?=
 =?us-ascii?Q?3/7ZrgI8+KjU9BoS5WIBArwkBN9ysiLENB4j24pNfs1fegRfCkswg8cWlf/R?=
 =?us-ascii?Q?WOMLzYbYDmJATQ7JiLv49VcMScCJo9K33+g4Qt3rdFT4ZWLKlVJQre6tr263?=
 =?us-ascii?Q?erc1fit231E3jfsIkChLs/I0ZCZurJFxcyXg+YGAIHCYmx52JuDeET9MCfy7?=
 =?us-ascii?Q?uI7teCOFmQ3fyxgeRBFgpZa2FgGrCWj7gwkX+JygUHfL81od/c0l6WD/n36/?=
 =?us-ascii?Q?Wae03H4g/juPz9vyYzVtb7101RF5s14+UKe3bkMwimekZPBTXYV51WagaJig?=
 =?us-ascii?Q?eI73FGqQCI3TNCK6XtQ3u9JYqMsi8qFYN9OGqqdfs+TGoK5aAE9wkxAkLBqK?=
 =?us-ascii?Q?Ui5zhKa1bHE9QznbtxJFvHg0e80elSov25kOZV87b8TQsRM+ZGKOq84rm5dR?=
 =?us-ascii?Q?fOEvHA97UcjZq1R3zc4Got6QlOTHbgvvjRUM4deUw2SNOXconIRSm1rc8Kh3?=
 =?us-ascii?Q?1OQMl+tFp+zN+jr3IUS/HfvoCXHfMsnSlS05Arha8NouAlqvIm0iZfKFDuzN?=
 =?us-ascii?Q?IO/buPGdLVc31ypoxpgAW9aM4cZ6KAIj5DzDknR8IILE/5ObxenmjaLgNpRE?=
 =?us-ascii?Q?haBxZ8hWtg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd6f26c-fa37-413f-7b9d-08dec837b0e8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:04:25.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2A9NCg1xiaAb8wjr4Mh2B62QmgFB02tGjs2hwYgEw13BmnefDdycwf5Rg5mIYY/CBEy7a8a64uiF+rqCV8Yqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D

The Chipset enum lists GPUs in chip-ID order, but FSP capability does
not follow that order. Hopper and Blackwell boot the GSP via FSP, while
Ada, whose chip IDs fall numerically between Hopper and Blackwell, uses
the older SEC2 booter path instead. Add a comment so the table ordering
does not suggest that everything past Hopper uses FSP.

Suggested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Changes since v1 [1]:

* Keep the existing "Hopper and later" wording in uses_fsp() rather than
  changing it, and put the clarification entirely in the chipset table
  comment (Timur Tabi).

* Reword that comment to describe the Hopper/Ada chip-ID inversion and to
  say "Hopper and later" excludes Ada and means Hopper, Blackwell, Rubin,
  and everything after that, so it stays correct once Rubin is added
  (Timur Tabi).

[1] https://lore.kernel.org/all/20260610234128.547952-1-jhubbard@nvidia.com/


 drivers/gpu/nova-core/gpu.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b3c91731db45..20b59bb6b7d9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -91,6 +91,10 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Chip IDs are in numerical order, which does not match FSP capability. Hopper (GH100) has a
+    // lower chip ID than Ada (AD10x), yet Hopper boots the GSP via FSP while Ada uses the older
+    // SEC2 booter. We therefore consider Hopper to be after Ada, so "Hopper and later" excludes
+    // Ada and means Hopper, Blackwell, Rubin, and everything after that.
     // Hopper
     GH100 = 0x180,
     // Ada

base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
-- 
2.54.0

