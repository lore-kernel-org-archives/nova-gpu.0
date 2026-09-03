Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6531F991
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405330; cv=fail; b=abfPaPwNmM7F0jGrmghyiGr9KXrVJ3Jtmk5GUsMFm42M28bkAIfzGXa7GiwLXSJ0Isq8A7/OuseipoZ1gSyOZPWJ83ImrF2i8LsMutz9vlQfmzCaIvJW0gVspDtp5JI824NkyeCjO6Et5PkefTh42TofXZtoxkQiYn6jWKENAr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405330; c=relaxed/simple;
	bh=PHEEgZlGUSJn8PS45RQxtqM2X4fC4Swm+aR3phUqYHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZmvnIfl+8b7fqK69ee/Iin10znvTWg0j7hdf1sNJEuZdVYDT/Ow+MvJOWpd5IRg0BQ8OmGXrKvaUSe84pdcgxu6EfqitV21+0w+UUglbq3KyKGKjNUESipSh2yX1absuOCiyge/OwE0Lh9CoZO/1AX+PUYGuJA5e32IUjoMAMOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HQ/cIJm5; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HQ/cIJm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rkqqp/OV4YNrJNga3wkK5bkzb1xV81B+q/Ya1co4Go+uyfxi/UBdDw2dWtPbmuaHwPChidX3bWdqLjCOv5TE7NboRGb+1eXvdvKvwTViJy+ofiy2wO4jNrISzysmtARwfj+wGDePAWvZ4Y8wwiHC2Jfw78i0Neu36qvPwCH2VNVlzSunbyQ/rHWpv9GP1Z/xrS4XrYFb8G7wrUpwE9BDn1v+XvQJNJZh0oRUo27mlLJe6+Qe7wBzTDj149WRsxdlGZan0DEJjVUCpuPdLdoY9EtxlTuvdnNXCoZ0QRHhFg0hEV5SRoHQsrUw3FIHcZ/VqPvGkQXpQboxsUMl7hrJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=zJpgMp5hHjjPrbx4I0I00OpHf3JtEeV0CF0VgqveXUFqELv92msTP11hgnA1EVgJ7r8CyxQKdlY3hCeTKGUxqY32JrEbWGpqOlGEj2neXvmJxh5b+Z5F0VWTQmxrb5O7AXZm3Yr8cljwsl/o0ry4JSdFMtqQvY6GWv93OeLxUk/ZGuwglWtRD/XRykoJA/0gDlhIDuhiOElinb/cWNzpQWcKOGCAFe/n/jauLckbF02FOFiZ1nkfi4NuvNn4qokerPqJjf3rVha8oywK2eG6I/wD3WSNOj6K9hXcmhYTjXC/D+FG6lEcPREN7ILXXjKZ4jgTOLSX/PC67wD3gZTPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=HQ/cIJm54823YeZCNWUDW9U6MepU8ajLGvg+/Gja25iW32dFlRQqRmNqKkcug78P97hYMAls9NzlXSz4Z1cFCpBk8ggvbGX1NXQOPUnG7QeTcErRPKOMDBHj4j5Ioy9Z/IHoAHxmeIVFtpJoJQ04DQr111uC7jLtyNJLExBnY95VwMP9mWMIdhj7gihziAXar1ejj5Tn6wBjCIkFmag9EUufAQBzDBpAU9413R9oDLH6LZZ8r/Vqn3tgKN9ZSTXwEaDxIkslzvHvuQLvpMBUhOtxs9kVgxRZm5Yt5mH3GEUrjAk9oyUqgp14NUzSUQoHFmI71pWdDxFH+Unxfclasw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:20 +0000
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
Subject: [PATCH v3 02/14] rust: sync: completion: add wait_for_completion_timeout()
Date: Wed,  2 Sep 2026 20:15:01 -0700
Message-ID: <20260903031514.1515905-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 560296ca-3701-44c9-04bc-08df0969963e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	mSTRl7aVhOaREij9r6Js0f8d8QRTCmdTFExiW4iqTNobQuMwAAgKOE+/lbpL9R/Es5vASUhshM+w1GHbKXanFtZNBnFU4lE7Oywi42x0enwNBeR6XqJP4rgDl2l9Yam35d82Eh5+4Va+6/jVdm8/ezeHxrGnlgkTqqhLr4M2VMqKgXkFMPVgo+W/qGtm0qrFNqviSD51v3mm93gi7YRQvPK3nuvvseF82iE8ez8cwcYbwpERhmbP3WrPQTfXHW5sJP39YkqsX1C0Oh5g3nTIxjS/n0BhxPWV2mfxhtx8Vpt9H4v0c7JnvfEJzGhoK2qKkOjDuhZQqdvWkGScVzLdSVHtAXr2jp23DJnQseRheQBeyRHoPZvDp1W7hhrrC1ZgtC3le/qTppXU5CAvFGSF+PQ8W+lY715OoySujTDs/uXNlOiZryC8EG1eDfz2uwZ7XgtAqYrUJjhQHqnG4qCPidO0hsdj2MtyDygN1wQC/3wKelL0IDaZ6osaMhNK7ay+X1nHvtedPAfnl7ug4OvJCpfu+WPAmkXeTxh5hqDF5cHEadIAZc8uj+eIZDtg6E8z/KQAVVfa9piyCc8bupCn2AxJwbuAVCb/SRQsOBEQHXPIv6xaKDlxWxDtJj4lax2Rzf6wNtQfUb3u2M9IbGHEIP0CiOOX8hzg/Yo7ymqnVlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MaRvl26RjlsoIAA20kFy4JXRnW0/etJkqgS8g/W5mhQc2SZPS27JdBbzEWi?=
 =?us-ascii?Q?Rq7a9mxP9dqZl+PCUztfdPN6Ny0+ioGUkJIx7Iq8dyfOsYj0Yu6TadE7KYHn?=
 =?us-ascii?Q?EBgsAiPVk9d/5+sUwfH5S1rwDH7QgzlTnTGu+/Akr4E6NoNqYGUeM+hqILSA?=
 =?us-ascii?Q?Pnk62X3PtkczRecdvatSllv4sM/QDVTq/rYNSBg85lhSPCsxLhw4loAtqv4h?=
 =?us-ascii?Q?HLLKpu6MrS1SjDqipQVPzvm5boagCIB3Ba/JJLAXqYdRCI6kDZh1ditbgxi8?=
 =?us-ascii?Q?b210XzI204egBzY6qrPnaAUxiJXHWLXJSAAedt2LX3EBYbqi+qB5xixzjwar?=
 =?us-ascii?Q?WmQXCKP6jpHWkoU1IUQXNGOJIkPoT0tJDEUDPCUr/RN5ZCObQBLvFLUjJjSx?=
 =?us-ascii?Q?iYEXjUkhMEgP68LuZNFeF1pgvsifHavn/sPy+7KD9AbDUMZfXIyJ9ZeoQJC8?=
 =?us-ascii?Q?RJAZ/1nfOI5IGlIbdPKZtlGLGkH/chy64kAeRdfUGVOV4/PCd6l2G0N3urAb?=
 =?us-ascii?Q?M/+0Yzjst8t+6F94N8f9o1Hxl/9k8Uaxx4k1l4vDHgzPt7g7mAgN+vXyoPnx?=
 =?us-ascii?Q?bwAukEkFc9FSqYXjc0t9AEMWXoFFhdN1MHz1JHWdjreqJAtJXWThTNU43o7/?=
 =?us-ascii?Q?0kD0RpfFzJPyihyGpwyRJHPcVAQJnSAajtce5huktG4m+oYYFzAkmL6vlMLc?=
 =?us-ascii?Q?RJq5w7YziedF8JXwVb9Frys8Wq+LqjNw7uVgVUtgOfSvUaOyREifRiJlO8t0?=
 =?us-ascii?Q?GtRio9G7ff4hm+i1UggfEnd2z1L2xji1hsYV4Nm6RiZkKFDXmT/K/8haIAZH?=
 =?us-ascii?Q?YfzTyhgkGQG86AxuQdaPOvOmFJGX9diqlESa5as6QwfhCUVZn4+DOpAiplLL?=
 =?us-ascii?Q?5XBjytfsTiREu5aOnMUOkoSJgXSuMVU0UmRFPLraciL85R7Xk77XKg6z5jqW?=
 =?us-ascii?Q?WytsAduMlSEqdkIaknb47zvlj2NjvObU02626DjzxgGMg16qK14VvSivr12d?=
 =?us-ascii?Q?vXKfkk8icYLKnSWwgP1hE8WMZS8h0LiWgq0UDgtZwwSXEn5z1vD+Zjgl8hp1?=
 =?us-ascii?Q?Ns1Or0KzsGZGpWn/QTYeYTuCZ4S5S9NPbH6G9wdHYHf9tSTSZSflKNXWBp7F?=
 =?us-ascii?Q?sEtWW7s1ub3zlie9AcC++2mKzB5FXRyvbnG6RnXwcr9Sw3/nZSVN80xOQUeR?=
 =?us-ascii?Q?Yugq+SlMQbftJkL/xc4pXohE7R2k5CuXwqrR55TjQREhzoioBPe4tKWmpSia?=
 =?us-ascii?Q?jFI97cFS/hm/iEte2Yd/dxAVjqNe3nFdr1p93yiuydvY5a0XxUpWDU0vIL9s?=
 =?us-ascii?Q?yiOdok4qEuoWSnXxHhX3XF2mI1JLSoh8ItQfsEBti+OP7uxCXhlIt2dQ4cOY?=
 =?us-ascii?Q?007woq3IxJTEviCuiQtjSpbneqbJ5/amk/wZvftNFedRkP3ye0gSV+GTMrdK?=
 =?us-ascii?Q?s5/8ZqsC4PaODgI2LCg0BlCotksv+0GrrrBKWwBXoMioh/S4QQkBQq5kLhfc?=
 =?us-ascii?Q?AP4RZRZDruzez7fl+Rms7cXsZFues+vzqKuy7ku87X4LGxLEaRGr4xptWvTN?=
 =?us-ascii?Q?TZ0iZGDb0G6j1Kfr9yuFqpivYkJWpMD4xDK2eW6DxOuixg7j0/v/oFLs8kry?=
 =?us-ascii?Q?YkyPS8SAW01H9PwSy/+lrLhmxCwfVJogx6Kd4ISkszn2uRzhjxtBOrpA7gHd?=
 =?us-ascii?Q?HYbwgH51qoSzZ1GYUlHSYO9h3aHoedFT0llc8oNsez+PaqZtOPORWs5A7h2q?=
 =?us-ascii?Q?ctT9U+0+gw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560296ca-3701-44c9-04bc-08df0969963e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:20.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Evg0KMH0ee/nhPMi3zW3tXihQ58vAFC0wv8KUFdVrWNR30qJKHaEpn2PhAqVIf4NBOAFdxDX/biMDXuVH6HL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

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

