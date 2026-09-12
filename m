Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7C2F617C
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188263; cv=fail; b=J1t1c2tKSic7P95IV9S9ZefecVQB7thKDREsMRf3PkIH1Z+evHzY/FQxh3zVgTrSonDQ22uYVvUkooaeNiPyX3WMriD9axQZnioxymAO2fHAi21uPN2xtnNpnbAkUDcMKd6cUr9mQLGIW5pkfuILWwPkjIXAWB+gkeH6+MnAimw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188263; c=relaxed/simple;
	bh=PHEEgZlGUSJn8PS45RQxtqM2X4fC4Swm+aR3phUqYHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kBQiLIRRyqJa3WYdf8iscwAG3kiXWES3zBKT72nsGg1vRQq1CodelYEiDb5Y7jF2v7UXhmhYQeuLDMZCVZfExBwNWn1vryxZtSMB5YUpu0GRJ3RWuBSSXZ+hPx4i06+Yl6v7JNtdMtfj6T/8trLWDm7+r9EIuZrwu5XKfbgh9io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V+jpxNPt; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V+jpxNPt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgwpu+YKdDAH3JaLh6X3qwln6uLqL6teb9rXcyJATolxiIXaNtTVpF1Ghbjs/efA4h6853BIQ3xbROCLWr7T1NCF+2khXucI64MH2TmL320g376/RJX20n+EbCM/0npSosq6iuXWcxFZi3G/qm4xMGbbdH0IIc/lQVTqla6IAW6nvrqaSpU2xKaQ89qAm9q4HdsfCc7f6RCXnz/nlSZ6BA0P2JQTMYYB3KO6YeqeLUOAs+y4J9Z+XggZKdKofbMRtUxEp9ZM8w459lTITXK3iKPsAmOtIAjVVv9tChU+I/6+bcGodnxOOJo/oc32AIGHEVEqltB/bOJ8GWPuBwB/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=YWSCpMG6Em6vUgL9bmGap9/ZzALlnpKo0XwBguKNiBPJ7j7yoEaZnB+KK+k//ZO0z4qnnk9FJlsB+y2quCmQ0yYwaCMUpGA2cr75wbqVrTqMJMFj5UMP5XrtoYEmoKe+1oC64r7XGyPHUM3P+itLXC0Y0nranQIAOjZTbaZSz1f7P1bWF0zFxxCPiXzmFta4PmODOPlGbxRRrvjlSeC/AyCirmuPiSS5yoJFypC0onJ7jO1mXQQLVwbX6LPqNPD+DHGzmU2rmws3/i34UsFUJFpScmexaaSaUJ71+Qw9QTnmzTugpAtMHyK7wU+Y73kIrzxgg8dHuhFuzBiQm0xHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=V+jpxNPtIvIFns45TzS1ZYk/aBlBvynRz0Z+bm2S+oyDXtWEQcBC3iWF0XEmSBNNM9rPi45QqeLe8pwQlZ+MDy/VVQ1kzvx8ll3ki4kU6nroUVaGxTvgnllVZ9EwULpikuLLE/fD4T3JwSOK+d9wlbFJSxFMvd0yBHo2pjvEr09FwvyQXkLdS1Fo17EiwiM2wajm2rBwDeVDBxn7yMLPP+gT1gCqgGh9F4A7DDo3yhRrh2L+kDvVhgxdYu+poJstFCThOoJ8MhbMS2zPI0/qenmUaCGghYQZ5zE4y+amGwV1Mw3mVfvH1CiyTbOMFmeMxLDRAXLMsyYFLqadHdE+8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:16 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 02/17] rust: sync: completion: add wait_for_completion_timeout()
Date: Fri, 11 Sep 2026 21:43:45 -0700
Message-ID: <20260912044400.677097-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fc9aa2-da81-4e2e-b255-08df10887f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	vernH6vjmFc7vbas4mGy3U9Kawhnxc7E2wDssnkM5NDQo5t5fGPH+M4l31RYwO+48KPPl076pXFnGnU0Vq9ARgvHFkE0zHKHnaucaivWMh7Z3BrE4Nn8ZOshBqJLfq+/R0MNiIb2S7SlPercZ9gur9zdY0zLrrM1IwjSONaxr+mWyVDg164bpzWj/841i/oXBA6al5xEA7wTKeJ5SqOOA3hbxruZ2W1ZcuobnpEVZwvfYrEjRotPzMKZnQEsf2aE5b2r2qGkbJZNlxXboDKhpBRXuYT82hHOOstH+ovo94nN0sArcpBdPQXeezAgCKZLED39ch5gDxMtr7T2kNF5Gv0mWTHr6elYV1q6maskY3IFog9MTdQKr7KO+g7v0wFLH7pVKxpEMaln1vA3w7AsUnMCvCCo2b/n2xR9BDqj1+qIe23WK9qRTLWRJI8XmEsHa35UmNg9HWcHrjkGodRIM9qbKOO2rey4F60YE8LvXbF6vqgxdLVMaoTk8w8+sND71T3lFWLiPsj1YL1VdEj7sddMaeOFukFk9KPyHGqAJn20a7gMFHrhK94HmNl1VK5JZldshrG3PtFvZqQU0l9iqTpRFXzI/j5UCcZeJpG3xqh3otnL9MDvoNnK9pT2T2C3ow0l0ZBKu4Fi+rs9/p+19WTFqaqKClEAGn0r8wUBvuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1bZS2oP4ddLGvZAORnxe7Cs8Z5JhRJU1O+ecL+qCUn6cAev9vNyQOBHBo0q?=
 =?us-ascii?Q?SdeX6MEJGCXj+DQ2Vn5f8zwWPthT1Fb8gaqiKaIX8px/u1eVqFXFBj9i1cix?=
 =?us-ascii?Q?oq+GEeSl6ImZgz/Rd1yhg5cM9FM+lSClbBGJC5Gp0+EfOx24AHMogFpEvR2y?=
 =?us-ascii?Q?Pa3qn2Wr2+2vHNZfDJbN7CKFzFOcEXW6yJmn9pIEoENejQVwnGOpfWNKflwo?=
 =?us-ascii?Q?BKl4zmSvQvlJTvEJ+VKjhb0XhHknGmYkOzxIt9bXwkssuwJyC5MvcGAStyBd?=
 =?us-ascii?Q?w1wJh1OYOK9y/Co5GEFdZ8TRv5wbd9XAhUlJwkV4svEdHGlMBxNZ121JFo7L?=
 =?us-ascii?Q?QbN85Fk7QiWWanqsS7RUvYviiF86hMVw2/zfbS1eHVuIlaNsTPIt18PzRyST?=
 =?us-ascii?Q?XnKbEF2aViJd/v5grUyy4ZgkgYOJP4Xchw9hTnTafyFPYh3hx7Vcc72ytkPY?=
 =?us-ascii?Q?dfmfkt4rm9btQWtXkUN344p+GGda7bYuX/WPopZBhOjb/EEHr3HVq6Q9Xm/z?=
 =?us-ascii?Q?qtiIFhJ/BxmsV/SNBAhOFCiqBbnC4q0NhFGa5zaEPTOr54CuZV/KIkojS7UK?=
 =?us-ascii?Q?TenC6KFUgQlEfBz96e7YAwmi1gyKaQEooQHyC8pc9cZyBI75wfFkHYK8jmTD?=
 =?us-ascii?Q?G3fjjYg17iBCk9PPkDtPfS3YWUIdXvNNykQmvWJHJy21Gcbp5aVTpgEzFaHr?=
 =?us-ascii?Q?kMm4Dz4xs4YvF8tFonNM0SW4lzBmj+g2S9YevczDZXp3tdvsYEKHtMnSNsRx?=
 =?us-ascii?Q?L5seOA2cLEiV2xOPbsM5tuAP4qhjaJlFyAztgqVLEcZSETPYP9zZWKCLcOPX?=
 =?us-ascii?Q?kJPTrdhMI2YFWaIwHoiLJxEMWrr2Re7k9yoe7luBF7Ub4y6t6Li57OCN60/A?=
 =?us-ascii?Q?kBTh9wXM/i56TRf/JWdCNju2oZUqJ6iyaVfDTkiob9pTtGQ0Pwamr+Rn9OcT?=
 =?us-ascii?Q?jhbSXE3WsRR8CVJ5pwxsTGSlAjU5NpKr2HE1rvAoZ16C2y8rfR7HeOtnZIub?=
 =?us-ascii?Q?LoWPnWBdD7lG4muHy83U5tFcYvGGjmU9MM6yMs25fF0KW0z3J/P6naHAY6Pt?=
 =?us-ascii?Q?y2xXKYrLCsCA69DT58iKIdJUAbLz3zLF7Ed5Ndlk5AlV+G1FrZ55zgboYmuU?=
 =?us-ascii?Q?cGOKrHubhE/RMIqdaxSTK72gB5enuR+mLlJrtUrko3u/Kx5nXNNhCFdyrqU8?=
 =?us-ascii?Q?/+GA25npoMA2BWOr2+cwHV2vKlGdnLJbzZEjmeCq7Hf+C6r1EbDzzWjckfgE?=
 =?us-ascii?Q?vwdX8+cJtOkASAYbxLwgfK4XI2CfmZJvH1BW8ZXDxgE1KfVUj4k27tToKAqX?=
 =?us-ascii?Q?6nLtTD1ekDjHN62sJVM9eSKGXi4PFu9IPkRjxyWNVrM6HIVGH6Gxwa4vcixX?=
 =?us-ascii?Q?sqTWFEboV33f/pouw+isCbXW7f5Aaz33MP0dweMmUxqrwmdBbwS1O0ZYEYF1?=
 =?us-ascii?Q?quQem/AgrMJgHCBNAS2JSpvI2baeV01ZbRtL3pTsAQyDg95FRDO0Kj5vx1K+?=
 =?us-ascii?Q?MXtcJcXU9QSqzf+1zkndSMOsnUpfrTst+zAMCrtpxZjVwPubhP2Cu11/j34b?=
 =?us-ascii?Q?8VVmZadpDvhsRgyR6ncqwcSIprCHVGvXUBGgcr6St4wOUplfGG2evSak3jRW?=
 =?us-ascii?Q?s+aGMQvfOPi8a+nNAkObXMicH1bIcHZwj/TPEfxVmEOTBl7s5frugv/K94tP?=
 =?us-ascii?Q?hRdWclfrl5jWbS+xZe1CYF3e9noZcvHMJaKHclKkfrAZ3eTVk4/KBfvmCOO3?=
 =?us-ascii?Q?2Jt5xMA0+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fc9aa2-da81-4e2e-b255-08df10887f57
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:14.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuSIGm+ypTKVtd9TeEkuOesOKKq7foYxQZnlX1FxiT4N68RuZDgYplk5s4xcNgmxCb/1FHHwypSpi73UBN7BcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

From: Joel Fernandes <joelagnelf@nvidia.com>

A driver that runs an interrupt self-test during probe waits for the
handler to fire. wait_for_completion() has no timeout, so a broken
interrupt path stalls probe indefinitely. Add a timeout variant of
wait_for_completion().

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: return the remaining jiffies]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..7e8b3c1c880e 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,7 +6,12 @@
 //!
 //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    time::Jiffies,
+    types::Opaque, //
+};
 
 /// Synchronization primitive to signal when a certain task has been completed.
 ///
@@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
     }
+
+    /// Wait for completion of a task, with a timeout.
+    ///
+    /// This method waits for the completion of a task, or until `timeout` elapses. It is not
+    /// interruptible. Returns the number of jiffies left when the task completed, or [`None`] if
+    /// `timeout` elapsed first.
+    ///
+    /// See also [`Completion::complete_all`].
+    #[inline]
+    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Option<Jiffies> {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        match unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) } {
+            0 => None,
+            remaining => Some(remaining),
+        }
+    }
 }
-- 
2.55.0

