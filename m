Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41E29D26B
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113811; cv=fail; b=VtP9YiG08it8F6JFBggKwMN0XlTatpmHa42Ec0shu9dcoKAj6QMqOtBqdgu3PXEORww8CDxK3YX181/tr22NmKePAbYVHmVZcurrv2FYrsMvAvGRoj7JzMv39kyBW/8IUm1fNtzWk28gVrxl/BLnFbuNxdv2xfsCPgTTOSIkixs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113811; c=relaxed/simple;
	bh=zfOx4RC1wPr71MYLHQV3NZgJdN7OI6sBAqBadhgsANA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tC3ooz5KYGOZWrihPYciwdNWMk/xUk5dgoDO+3yom6Y5UzR5aUnbn7m+LH3pa0m5oCWPqowPj92lh51sFlKijbOfjB4drPQ/EgOE3Hhrc9R7A758FC2MruL2M9NVs837FX97Ut4mmCpmPXzjbyWi6K7gmVPFjxIQ2PMVGgdKon8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rskqU8A+; arc=fail smtp.client-ip=40.93.198.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rskqU8A+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIwSUshVXkfWIo/P+T1qX6ToXCltprFydxQCoItwtLgxQxEF2+aBkKvo7H6QurDChjCbwA8LLny2yi5V2jDfrymum6oiyZh9I6FKH6yHYwSKS71Al7ZwEk1UAWDFbvfzQt/CPUaA/aOCuFDHURbrrwLAnfV573Z+YIyEsNFLfWAmc1MGCSjHuTEEieL1EihsKYfhIVSoq/58UlzBuvBZ6h3Tf262hRErRIe0hdQoeJvwEAu0EpP09YBJYOt7s1QdAFL4F/M1ctzChYTfSmWEdgwv7urwsCF0nI110d+gXAWcj39yNKDQ4ja8jqEC6KgQHh/UaQC1jGtF6HzhasZ3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyDJjcvIM6R8/dFwgq3pBrUKIbD0BPlOHsEYE2CXFTU=;
 b=MtDQXLAY+zbRyVVGK/RlpD5zJr7prACB+scu+3NlYNnh7kl1JjBms9Z55CO4BFB9U1sguM4IbHeC7L0BtUQ8nQtLPvmsRkpdjUdHnhtwpEldVZZVu4ZL5NNCAHATKTsIUb89rxZoC1ZK4ibecBr6smIpl0CsJWzOQXoIZUFTs8f+95ea9/LAfJmS6/El7jMjncsec4Y7Nm65dCu3n3rkVQs3NG8ie7YBAbZxIduLvsmawxXjXqtMHv+uy+bwJzYm9YhNkYGqVjVPMvc8CYy1mkDJfdEblg6HAhKy4NnoYMV6+XRq/oQfyJEwpnhs7j+geM3PSlRTkEv3cEnKgcMy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyDJjcvIM6R8/dFwgq3pBrUKIbD0BPlOHsEYE2CXFTU=;
 b=rskqU8A+ceWAMe15GDzFnyphoIkPoZG6K+UqCJIpat83uzZbWwHGjVd7Pom45lxtp4hP8GpZHOX56M4glis0yfXC69rMTCQSc+opGyffnUhEiJ83RpQA7Z3DipBKZLbiFRyYWke/iUgbER+3qZCNNf6j5Up2AnDgKa6YC6ydad/p8hKeWtRkXSi4TR5YxOzLa4xx16KDdYJNpnk44DVSVs0l8Kv1QpIMLuQraLg/WqQVSOaA+7iIoiCLifhWUb8AZbSN4DRtMRszQf4T1hZrrXLJ63V2IV49jybXHNqwjwk0b6ms2gorz9qYDnn0gsxrs4rHPEXVuy89TbUStswXng==
Received: from MN0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::29)
 by SA5PPF80B25317E.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 17:50:05 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::1c) by MN0P223CA0016.outlook.office365.com
 (2603:10b6:208:52b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 17:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:40 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:38 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 1/8] rust: firmware: add request_into_buf()
Date: Wed, 10 Jun 2026 12:49:22 -0500
Message-ID: <20260610174929.744477-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA5PPF80B25317E:EE_
X-MS-Office365-Filtering-Correlation-Id: b59b85e2-058a-47bc-c775-08dec718b328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ua0vfCXOXhtLatGnJCI69+jRxXitI0HYKiv7HQZhBwPnmWGQ1RYUpwMNoD+Y2PvTpzKLpQHE5y/pYIe2trWbMjahr85kkgDd6Px6F5HAT5Ko4Lx3MJfHuX8dqEB8nnCyNqBNh6YLYvMHq8Lz9607qgTxvZWJfzmytsjzHp2Ot9TN6CLehSdsRr+oNuCX6GM8H3vQPQf/eTaeOBNgqwWiALS6FrN8cywj8bVYlYpImJUGJ63ZkS/xJmtfZb5p9CrFg4al41WQOIulXkvwLC0kjDbHvg0dsFD6dlpm+cujPJwCnWhRMBzYZWKF2NXMYNTdnWj1htmRM/PHYyhC1GLVNIqejAPLzJKHDeoTKNUzeVrHiHpSWKWHRi4mcDjU5I4s8wpTs0oCL40Dn/TjuYNjVOF3mU5HQhUUsQo2zOq/Ci37PUm76yxnHPZZ0kPt6/QYC9Xcv3ewtf1adqAHvwZCmMCjKAM2R6Yl8aQ3klL5MvuLsFF2Lk0KJuVDXO6f8ZROYYX6dET53AFy3HjhT3ptQHAfldqMx3Pri9fFKQtg5q7uW4oBHhAEBQubhU4x3zyMHt1c/uT6sfAni92NDHzuIdYApIlGPUvEsMLAI4wPqkEpUt4NBJLdELOgput5q4NO6QyN3RRo9kEQ00HM+cdOgfHRMIyj9e2z6JoRJmmG0Fi7kA1juEFAeWyGTGkbaTHAoUhzWwRerlxUXXQ42cpi83XPnojLRD/5gGOHK52jsOs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GF9oneTkJrgj1g6mZAMXYcs8y8HGUb/kxQK7nFz+hawoQasuyGI5THYd5lvFhSW6e3ILvQGViTEpZfblEYnnANzesShUi4C6tZGh2GvcHTiRMhBIsUKENKzLmZohUBPFGsyMCgY3kFgKr1TaBkGznGVpWmYz/svN30KBo7Fj9r1U69nSEQD783w76MM/HvC0YVKRhLzVKnVxElsJ6Nvii3RUDgAas0+jDMGUSOHt7EYVkLJoChEDcF+G085eVNulA+IRFhYHQ+YeoJoNZ7tmz42gwDaV426RU4R/u3zIXSEkvoRfIGRz+Wmdq5EnVK83hc8E2Poq7/bLO0jySkNigEIW6tj2a9B4hjiJXDrb3Yg9rH9qkTXrBCAOA205KhFuJrX8y++EZCMoh+xg6OnKtuurcmAY03EI7UWdijMlFyU6lk8B56y09/PcEaetZO00
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:03.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59b85e2-058a-47bc-c775-08dec718b328
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF80B25317E

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..d2ffaacc2d43 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -120,6 +120,51 @@ fn drop(&mut self) {
     }
 }
 
+/// Load firmware directly into the caller-provided `buf`.
+///
+/// On success the firmware image has been copied into `buf`; the number of bytes
+/// written is returned. The caller accesses the data through `buf` itself.
+/// See also `bindings::request_firmware_into_buf`.
+///
+/// This is intentionally a stand-alone function rather than a `Firmware` constructor. For
+/// the `into_buf` path, the firmware data lives in the caller's `buf`, not in a
+/// kernel-owned buffer, so returning a `Firmware` would expose `Firmware::data()` as an
+/// alias of `buf`. Since `buf` is `&mut [u8]` and the returned handle does not borrow it,
+/// the caller could mutate `buf` while reads via `data()` are outstanding (and
+/// `release_firmware()` does not free `buf` anyway). Releasing the bookkeeping here and
+/// returning only the size leaves `buf` as the single owner and accessor of the data.
+pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result<usize> {
+    let mut fw: *mut bindings::firmware = core::ptr::null_mut();
+    let pfw: *mut *mut bindings::firmware = &mut fw;
+    let pfw: *mut *const bindings::firmware = pfw.cast();
+
+    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
+    // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
+    // buffer of `buf.len()` bytes.
+    let ret = unsafe {
+        bindings::request_firmware_into_buf(
+            pfw,
+            name.as_char_ptr(),
+            dev.as_raw(),
+            buf.as_mut_ptr().cast(),
+            buf.len(),
+        )
+    };
+    if ret != 0 {
+        return Err(Error::from_errno(ret));
+    }
+
+    // SAFETY: `fw` is a valid pointer returned by `request_firmware_into_buf`.
+    let size = unsafe { (*fw).size };
+
+    // The firmware bytes are now in `buf`, which the caller owns, so we don't need
+    // the kernel to hang on to it any more.
+    // SAFETY: `fw` is a valid pointer returned by `request_firmware_into_buf`.
+    unsafe { bindings::release_firmware(fw) };
+
+    Ok(size)
+}
+
 // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
 // any thread.
 unsafe impl Send for Firmware {}
-- 
2.54.0

