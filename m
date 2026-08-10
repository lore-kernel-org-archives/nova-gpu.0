Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FEB3C1D54
	for <nova-gpu@lists.linux.dev>; Mon, 10 Aug 2026 13:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370289; cv=fail; b=OdJAzgub7L4zr0PXgO/BhYeWbp8atbhtgRs2XuKza8ZVhPnF5DNL1UY9JgO4P7z4h/jQ3m5e3V/ZK8BGPwE/yXfzAJcO5xh5dI8awz4Rq+mlxhA5djgQc11iZTDG7mymGWfU4qLKo4wcgQVcC0dPseMT3BllXgB9ZFsATUB3f/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370289; c=relaxed/simple;
	bh=B0SoJDAPkHUJdXL7r4Q58vnagRW0BzbIzIO0yrqCY3A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=azaiJEGSw4cIHQoSkSl3xktNY1xd8zj1l/rSuay6j8KZJ7CnUsqhMoekKPgk4cTk+RIU3NSXi4Pk/9J+ihKxR/rk8x24Bc7zvMp412jKqkPzENxK5h1ccXYr3Fh8o5hhaGEFtruAjrgnDZ9mBedMphQRBiI4kj6KlYi0/xl+jXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rh/22wo8; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rh/22wo8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km2PPZYezwo53iYXh+E0lM0cOQKvDjDmEb2ojHYeiBI6wE41mhQuerzw/YZpeqtaf6MJYFPDpjnzVBmeIxb35z37yVSZ3TRpn6f1BMYEzvfbBnEYvSUk6dMi76WwnUApmdwLR8/Dxz7T0CliQTLaZBFfrHrxrbHDSfMhiUyQb9vYqos4V+xPESRs8Dlm5bOgZ10qd4rA5+JrSf1ibMm96ywretIbEMjkz7ycoImjvBhwwWnW0+qY5znNO0P7DgwUpeEf4/qrL+KNJnqGumRBSH2cdQ7bWLWy1tFRGanLxbKHfJgkgcQZ4NmucZJozKDs1sxUM2qok8mbxvrmHHyUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGOBl5a/xNWCXmOTaWTF7DxH9KJC5yYDPccNRx+MRTQ=;
 b=bibfZ3ysdM/u2mssJwkqhG3y+KAa58K73fC8RJgc24lJgth8F3/gs5S3zufJpjICZ9gIshD8KO8h04Q0o7QGlSKR3k6tsEB4aakSae3kAr/IqIsYEfe7n0O9ID8DrKEd370zaTz1hBKJR/UGhcctt2rDYgGi4nuzB8XEpXl5qHUMMdJaDJPqq7trT2mwlEMXNI8LtAvnwdhpaMSLBf7u8LOBY6k3PIAYHi0hCo5aJjx3UyRUTKg88qVAnTg5TUN6u7J0KZOi86eEhcel+ZO7EB1QV/MiELhlyKqceWB38GrIFUHcdd8CWrahSOcfQQBm7cdWBWa7izPM9LUCl9l+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGOBl5a/xNWCXmOTaWTF7DxH9KJC5yYDPccNRx+MRTQ=;
 b=Rh/22wo8CpdlzlVZTSBPW56vSoO/coigdVMqzk2+FJVS9r6Fik/LV3GT4w0oZP7ub3HNO+osQ+Y3pcyvMcfTGIarbHPeqEj3EkY3h/3gcpfDlLZld/Of8vtOuYXxzwhIATHffFfcfDYGeB7IETbLMoIKyx/tpzSANVHYEFJbtrIlkmJK+yv025N76L1ojpDTNXVC4Dh5sdfOtakpeglm9bFYOqw+fR/HevAfeb++h4f7nJdQRCLWmfaEUM68X7Z/53Zs3Vf3//Jzq5hukDCcIlTnK8i0RvA9i/9nV3IGYnGJ1DPKRUlAFl8y08t7xuC54e6q9xlnjmG1ibHrbaAw6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 13:57:58 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 13:57:58 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 10 Aug 2026 22:55:27 +0900
Subject: [PATCH v2 05/12] gpu: nova-core: mm: Implement Alignable and Debug
 for VramAddress
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-pramin-split-v2-5-65a00b3c7309@nvidia.com>
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f64588-5cbd-4347-a3f1-08def6e76268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10070799003|22082099003|18002099003|11063799006|56012099006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	52vTtfdNVXop07pdR0pEH/sqrZLBZOnIH04AFtvx0TmLT91/vtP5B85R7ReZcf5OTb3wqBZ0ZyDHuJvAj50mrYDbZrcqpCLgFwF4HcG6r63O1UEcvMKy+f9a93qXQFE+MAX+VoPMqi0gs8mRPl9Ch3FQi3HzZNK/SIEfTN+XESvK3Buk/eZ+peW3MYVKe1mgDeO6fenunFKtt2RoJdg8saCO6lfySU1y+QBcCJhUXMUHZieq7E5uB3lCRVbinGcwShZdjkiGfRmTPA8cz57l4jpplq2L43v5L1sa2cWB2dmUwZ8BOLSTpoJ8NhU3oaiKgO03FxNNvqEUBPueG7/BBc6J0JH2un6q8frm3Vu/kO9m/Fgs3zeh8v9sicP+xOVcBIMmxQO5bogAcGcOWqBHK6MhR8/mLVdtCGlWBKJ0hBBLZZYDiC/JKetbTTTf8vbDlK1JYS+L/2mvji2CwJCooSo00n6UbVd9hN9iTY1YVUSMme3jQ6i7yMdNDwLI19ZlxCNspNZmgVVdxzygAOtqptECBVyRzxAvKObdBoWr5a08Y/oBqSgO6GrB7rktk1Wr6rOJlEO1SrZiNbnOxYJ5T6tJ//+cOOTy6MyoldUL0Ec4GXJWd6NGhvUwc2YtL9EtMDjEADLcYeAbrw2xmHkt7Av3NEyu5pdFfM2Ypr6C2Miqzyk0VhvUMhUprxdUAnksPFdzt8jVz+36IFHOghn9dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10070799003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk5Ha0FTRGM1ejV5S3JSR3dHUVlpRXlYV1VLbWNXTFZUYXlzeVZRWDAzNGVJ?=
 =?utf-8?B?RG5xVjArTjBIQVhFNGRCdVZMbHA3SVoyRTN2Nmd4YncrclozbjBsVnluQlYx?=
 =?utf-8?B?VVkwemRKdExNdFhORm9qZHc2L2hSblhkSWduRHd2L1N3eWRxdlNqdzBlTWRT?=
 =?utf-8?B?OHpsK2dPbUpUVmhMWmpoTzRmYnNxdFNZbGhBZm1QczMzemdJVHBFREI4OEhS?=
 =?utf-8?B?T21RbTVKRytVTFJjd1lLYlh5K2d4c201SzFvenp6eWZwWWRHMTZNWC9UNGY1?=
 =?utf-8?B?S3pqbXJ4S09ScDczM0Z0SjI0aHA5MkxaM1RHSGdBLzhvRVlRREo5TzNGbzdP?=
 =?utf-8?B?NUgrdkR4Qlk5cnNTS3FGeWx1TUsrVU1YVGs4bEh6eFQ4L2FOWnNwSFlvem5W?=
 =?utf-8?B?UzhrV0x4NUxrM0xtZTlwc2x3M2ZqRDluamw0dVhvblJzbldHU0Z1N1gzQnFa?=
 =?utf-8?B?RzNaVlFMSWlTQVBUeXI4VkgzaGltTnFmUmJiQmtZd0x5aG1vY250ZUZqS3F3?=
 =?utf-8?B?dnAxSmlRNmxZTFYwOXhndnNyUXpXR0Fpanc2NE9mNVpCMzJ5UmJuQVlIMWxw?=
 =?utf-8?B?TG8ycTlnMVlhWCtrKzJpbXViZXBQTmFVV1NRNXhiZm5JbnRFYjJQZmwwY1BF?=
 =?utf-8?B?UUh3QUJWcHpQb2svVmltMFBlUzM4d3Z3YzhrTGNHT2k0aE9aa1RqelcxUWZv?=
 =?utf-8?B?aVJSQTBWZDJVZW0rTHM5eWJGa3IrODN1MVpFbmJIMWJKcXI3T25KcTUxQVox?=
 =?utf-8?B?UHZBa1gzcUM3cXg2a004MzRnbXFSSmJKYmEyUEovNStQeHhxVFk4YmJWemZt?=
 =?utf-8?B?ZHl0TDdZMEwvS1I2OStVdS8zVXAzOFpSZ3ZTdGY1RDFVSmNWaXIzUVZKbmZh?=
 =?utf-8?B?QnRpTGZTQkM4MGdwb3lwdU5IL3ZnWGsxeU5wQWFNdEJoZk5iWFJqZVRTQm01?=
 =?utf-8?B?TytlMTgrYS9WWE5UN2tXa2pDM1B1Qng3L3c3K2hxUmFReDNMdzlyY2xoNHpy?=
 =?utf-8?B?bEtnUHJsMXR6Z1RqV3drWmViL0U3Z0RZTnUzeE1BbkFVZ3pJd1lGZnIxOE9U?=
 =?utf-8?B?QkV0Z0Q3UHpLc1ZydTh2SllpQlB6Qm9RNXgvaHZTcFAxZTF0MjhDVGRuZmVE?=
 =?utf-8?B?Sm9QUldhYlB5NXJrdEpheEExUUFRaEoyN0xUVGxTZ2gyUEdaWHlZMGl3bFNp?=
 =?utf-8?B?cHZ6MFJqeVVPWmVGYnppRXNHVURMcDQvckVUb05SbGEyNWRsMWNmV00xWXIz?=
 =?utf-8?B?NkVwRkdTR1RRNU5iUkZiZmRTTnlibVFtR28zK1l6aW90V3BNTHdoLzBpRERi?=
 =?utf-8?B?SWp5T2wxNW40N3lzKzlkdVZ4UDBSUUVjMUtzU0F6TDJxaUVJK0FqWGdORk5z?=
 =?utf-8?B?dDNNcTA4YUszaytLRFZNczNMaVBieTc0Wm1kR0IvVGUzWkFPdzRlOHlHdHBy?=
 =?utf-8?B?Nm4vMzQ3RnpPWmNORlowUDk3d0t5NlJHWTlIWVIrYnFGZkhDZkpDeE9kM0hO?=
 =?utf-8?B?ajZGY3pSZ3NlWHh3QUh0RDdPVXJ4TGc5bnU2NzVhMnlPUDhBSkJ1K1Z5ODVt?=
 =?utf-8?B?a0VtaENrR2dyamZuWFhKaTNCVktqRzZMTHVEem5YTVRnV1RlV1NGOUxkK3Fv?=
 =?utf-8?B?c3Q5M1BoRTk2NWlnOTVxSkc3VWZBWWJNb2JOSCtUNDQrZjg5Y3NQY3Z0a2Uz?=
 =?utf-8?B?Sy9XU1AyZXpXZ25ZNDJ1bXo0aXc3NHU5WVd3bWF4ZkdERklLVWFnYjNNcmdZ?=
 =?utf-8?B?MnlUNUdFWlhlVEFKNUtNbkVrREVxalplb0hITEZNQWdpSy9zbkNLT0JOUTBh?=
 =?utf-8?B?RkdFOTB1c1d3RnlXdG9DMXZ4Si8vdHQxWlBDZk5mYzZpNWwrUENJNUQzMFlQ?=
 =?utf-8?B?S2pvSnA0aUFaaW1qVkJkVVkwU0xoTUdZbE5wUGE1VkIwaVhFb0lvdllXbWlD?=
 =?utf-8?B?RUEvMVp1Qy9ncnZ3Vkg4Y0JYaXhWSVhtc1h3VUExMnFsM04vZ0VjSEdBb1A3?=
 =?utf-8?B?ZmdZaXN4Rk1pbzdlUzNDRlBuK3hyL2wxRmlTOWR4OUhtTERaWlEyellSUEt4?=
 =?utf-8?B?THFIZ1NJVEpHS0lVQmt4RTNaN0FaaU9VOHNuRnlXSmxoT1FIR3h4bndMN2lJ?=
 =?utf-8?B?dFhHZGgzSUVFNktoYWR1RHFTVnZBU1FiZlRtRXJoMGVrdzZNSnVJeWhvcmJu?=
 =?utf-8?B?TExTbWFXcTRIdlJIYWhZQVR5ekxBYUsvQVp1ZnYweUNHNCtLWCtTZkRNQzh6?=
 =?utf-8?B?dm9JeElmd2dIbTUzWklLNTU0RnZ5MFFBeGg4WXc4cElCMi9tS0cwNU9pcktB?=
 =?utf-8?B?RzkyQ25BYVRwOThjWUx3a1VYSHZYVGdKRmZTV0NGTHhmaE1xRWVJNWFzdTdS?=
 =?utf-8?Q?HP6yPXiZdZWYGuRScYAwQsIeUnnIjK73gx0TZWph/p7jR?=
X-MS-Exchange-AntiSpam-MessageData-1: 83yVSePgeY2qTA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f64588-5cbd-4347-a3f1-08def6e76268
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:57:58.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1VlFTGqIDpH72PUpv+rHnvJf1C9Nnr6yhPKaM8oihphAy7tch1s7YhcxAcxSvMv3h+So2AjMw4+PfJoG1hrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208

Later patches align VRAM addresses down to the PRAMIN window. Implement
`Alignable` trait for `VramAddress` and plus add a `ZERO` constant.

Also print the address in hex under `{:?}`, so it reads well in debug
output.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index dcd5e5e919bf..f9d80ffbe01d 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -10,7 +10,14 @@
     ops, //
 };
 
-use kernel::fmt;
+use kernel::{
+    fmt,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+};
 
 /// Physical VRAM address in GPU video memory.
 #[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
@@ -18,6 +25,9 @@
 pub(crate) struct VramAddress(u64);
 
 impl VramAddress {
+    /// The zero address.
+    pub(crate) const ZERO: Self = Self::from_raw(0);
+
     /// Creates an address from a raw value.
     pub(crate) const fn from_raw(addr: u64) -> Self {
         Self(addr)
@@ -37,12 +47,28 @@ pub(crate) const fn checked_add(self, rhs: u64) -> Option<Self> {
     }
 }
 
+impl Alignable for VramAddress {
+    fn align_down(self, alignment: Alignment) -> Self {
+        Self::from_raw(self.into_raw().align_down(alignment))
+    }
+
+    fn align_up(self, alignment: Alignment) -> Option<Self> {
+        self.into_raw().align_up(alignment).map(Self::from_raw)
+    }
+}
+
 impl LowerHex for VramAddress {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         LowerHex::fmt(&self.into_raw(), f)
     }
 }
 
+impl fmt::Debug for VramAddress {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        f.write_fmt(fmt!("{:#x}", self))
+    }
+}
+
 impl ops::Add<u64> for VramAddress {
     type Output = Self;
 

-- 
2.55.0

