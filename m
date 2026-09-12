Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873F38DC69
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188280; cv=fail; b=e0MA6kUXmnrfBcmyy9VOoF5NgXPQGc48hUMbaG2old6IH1/OgzyPN6kjMpZsHykOcIV+jWJeCKdg+ayXtCS6KXrQ8+Ke0jiZ3Km3Z4GZlnV8DomdVTnDgzFn3hX8HuRVIkO8BS9POQdfghUhnJezzg354iaNMLb/6ExUKNUgf/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188280; c=relaxed/simple;
	bh=DnzfH71oI8wmg8ygH93I6BfFKJfvWyeC0r1QS5rbMho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r4oHC3+JHYgWrsnFG0f7F8LqLmYqQvs4gAZ7mr31j4Wdo7Ke6AFR+fylPVmUcpNcw3iHJBqr6inmpDLLCUe7IarxilSOgM4vweXH29GnE89o2jzHJohNZskaDNxYhD6rAP2exLBBs0IBraYKD5Ui9Rm3DMIMLzVkdQlRje8Dp6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hDRKSoFL; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hDRKSoFL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnG59Lb0LOQSZcLpeY9AZ/6urvlBfWcbA+yFXvr8q4JREhzeXU3dduq7Jmrqa45c2chsGJfMk5kMXS8C2apAVDTo7kf2ZHavnqEiXJ6nseDkkCrh2Ufa7ngejjcF5xSqW+p7ZXvNPXC2yNIkBgG9bgOUsO7znNVOF5cORgFAhc14q74SDLHRwW8J1YWPYvCluqCT/yeR/Kyrm6NPFSvR7tvF4xCeSmPKvwzJbZuFAdSnxEK9PiZLEoy9ageEQStrO4M+Op3G4/JS8jTsim8H3D+owfv/kH0rSqEPWVL+7q8rg2hdEpypo/F+8jIlj8O4IOVrVbLoSWP6k5UNyQ6Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVvcaEi1cOJmE6u5fY0SxSXv55Es7YY2jRBzvxzklEY=;
 b=YlxUIPt4P5MquTTxRxJgKJM/Wwyi7fU5KQPeuKHdYh0ZVlQ/nqBUgPsbFTijVoLZkvofH2xvSW10LHav+Jkd0L27pwQIBo00j1kn7TBdEp201zpxHV3ucHgE8oJ1rEH6hK/AUFkffabWE97pXiaCsAFKXjF7/KRG4Zrb2a2vlR4DQhMOUw64TzhsG5LXaryxoDPU3WNIG6kMRpEWt8ZgcPhpOvUqbH2rrLsfvYdyhJZod5eTh2AkiPK8Sx+AodfFk85hSWqElbc+zSG+d+zulU9mMQYPA7mpdaknGc5kEJZcpG3DhPQD9EUL/Lbf+HtoJdVu2DVXEMoYgT13aEwOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVvcaEi1cOJmE6u5fY0SxSXv55Es7YY2jRBzvxzklEY=;
 b=hDRKSoFL+W6gcV58BMLG9EH+qRFX1ZTE5PnslHwF/or7NLHc4HK8L4wIQLqyp4REZ/zxtXFnpar6XkaLgC+dyu94nn/j2Jj5iTTSprTAk74xN64bC4I33jxuCtzr7riiZoBzIIqoBJ9u3UFsAhcbFivyI8F1kGafOodQV/rX+gPjnYphU/Esl7KIuP/CN5TxgIhi/C0dF5Z825StKz1bDR4sAL5kpENM/lIvoZra+rBOD31nmSIMyZv2iJG54HglLGCgLaLfbKf0Re9XsUHBVVuizlFVhNdFJi8+5zMgKA0zaE2ulegiXdhNxKo+aHs7xfCIjBhC31EB6SJR1mLgqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:28 +0000
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 13/17] gpu: nova-core: add a GSP message queue drain
Date: Fri, 11 Sep 2026 21:43:56 -0700
Message-ID: <20260912044400.677097-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5df4de-d265-451c-07ed-08df10888742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	DDaoc1LrA4zg+8ISzBqoliuiZFyft4nXwLx8bpEBo/cIouSzZE9EpORq+8vmIGFS8C2f5FnCmzPUnZEnp7QVSQOIoOe0Vx6ZCx0cDQXa4Zj3PqBog4Rbpyyy3TKhZ5r8rwnm076kCe/k9EK2ZIO1aMLiTRb5eI930ucxAm6LB2nDT99sbDedjhywHtjqyH33txHDQK7HYbSxMHB0cRRBSBup5JTJBZEpMh6FAUUui53UEN2sRDUasco9+DIw5hAqzg+YAOe8uD3FkKoEvDGjvYd/vw3q1coVIynKPP6b5qO4MRGtwlUx695kSiZAswCDS8elCAbwYpYW3m5cPgfAF7tZX1TYY/G6892f/+337uds6JSakvvDw5OlN7BdFe3L0z699Jx8f+qoawvQ0PvrMounJ69NRo4pQ1VerxRqpUi1XWoHUOyn8dWTFEl01dSRKZUwqVg/Ti2QAO9S/HBY+UmG3+lVeZ1045QY/1LZqlXFMldjwWBlHIKRLFoFnz/pdv9rCXG2gawl/sXexMYlxhal7dPXP46/v21/JWkW+ejAicDM5N7a/vIL+CWkWpvnkLTNlksgoefUh9z8kd8h3s+mPF4AS0dsl+LQ/z7htR/aNyV9ZBfB9KLxH7/LteVUqP3msEF0p/qBa7CjHw597c3d+4lW9bi05vTPUqRNfWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7BKqw/euFll8Khq0PX+DYEzCxc6lG7zMVxlwgytLCeqVc2ijFqmh8KeOQMon?=
 =?us-ascii?Q?Skf6h+RVP2+IHXacC6B0HjyihxYnhohrmXzW/2aZ6rQCmCDZaKUiLjInEDW7?=
 =?us-ascii?Q?HJwFwtIwWukQoHN+31vihURkX1FMKlAoBrLdX/r4VZv6tGOU0xt/N/AwTtJy?=
 =?us-ascii?Q?q75TwpkStExlELtjJVtBOU0ZO5xsLrIc5o+HpMz9bTpunhH4HAG10HESCQZw?=
 =?us-ascii?Q?hFWRrp4jhzHfzOJlgD6458f61G3M2wcDhwOpSkR7n4LyPjcVAytPICI2IL0S?=
 =?us-ascii?Q?v/eQAfPGMLHu3qZA7Xg9V8ORi0dvW40+HFesXz1FgxwsaJhgnJe7KoIrDgar?=
 =?us-ascii?Q?7TdhbMaCz5/roVs/044Q8i4qMJ2A+CikgUUl86SbZjhQb7+Gv5tSOFH0jYk5?=
 =?us-ascii?Q?I+vpx7AydNOB+4ANC0cAKeA5Vt5bfmCbVg5CTlgvEobZ3An2Ib6fL50PetAe?=
 =?us-ascii?Q?o2YMLCzWU28ztzWeFDDaw4A2t1ga9iw8PV7XC53wxBhiOr3ZIC+s8YMIk5+l?=
 =?us-ascii?Q?iAzjrJC7IkH48Cy7XkvqKD+a+Ylsm1AITAwxUXMg/pRL4cS5MobS83unzuUf?=
 =?us-ascii?Q?I9SJgaHjJVZ73U2C9thGg6LcCvBDOU9VOSKV5rt2IKyBan/i6QpGGCjH23D0?=
 =?us-ascii?Q?/D5PDGQSd2SatVkekkBSGmi6UGEo6gZJ+gs7cwMb/rOJH8pX6cv7HYcg721/?=
 =?us-ascii?Q?YNSWfMDwMH+8o9JDmtRZboikKA58BCPxVjdm9E3OJ81D46G4a4zoJLf66cx5?=
 =?us-ascii?Q?W5/CGePJprCocKNp3aP58jxvy0ZaX9Vy6m5cRkwcL+mBEHkhE5QbEHXnVxhe?=
 =?us-ascii?Q?QEazLoSl7uGxkmELP4XwmbINmuyvMIGpbq0iEpUDxdjzHP64wlmYYx9L2ijI?=
 =?us-ascii?Q?Qxv4s9xEcRL9fFaAnx3N8S38wUf8cbo1C2WIBxtMXNYXGhdQq3oAP1e0ADw3?=
 =?us-ascii?Q?mgQU3pBbmZc25KKyizPsL913fYcg2fLcy+Aug6AEIeGdRRpy8qRF4xe9IVde?=
 =?us-ascii?Q?mBR5WGYqF44gevuN/abuyPo/CzRWWocUabxx3yen4THqO7hueDNhjiaZrum5?=
 =?us-ascii?Q?sAhociT1Fcc+4TJdN1Zqqz2gZwxtHjuFCTqL5BUV0+MWryepH/ootmzqpi/d?=
 =?us-ascii?Q?fBSd6TnaOgsIUfnKHfogH5D4kIEc6eNVp+G/kkNc/BJxEenGAct3xELxIHFP?=
 =?us-ascii?Q?3/y3uCKYEopbbQpbRdweyLArWr1M/yBFowPoIs/tsFs8y1M5M6sx9j2NASYi?=
 =?us-ascii?Q?sm8zIJAaFAl8TpJ83lnjaou8dKDMszkTPYaJ9mz0x130irYlm83WCwO9bYHO?=
 =?us-ascii?Q?NpXUeYzosKDjrhpxkP+Pcyfun05k+/ghTir4suAYPJBr4jRcgouglhVmYGD3?=
 =?us-ascii?Q?w4ZK+v3LMH9qKKjBVxjPDApCEGqNyo3SM7Qz478Py+KNjQYEgIQSUlQSJ6VY?=
 =?us-ascii?Q?jCFY+wB8VdQbSCNaR2iaFEDRScRjkgw/7/6LAjnvU/D+6jPFoX2NK/w/W96T?=
 =?us-ascii?Q?txJpQu0ozdk2p4n9jarnUZFnTvpMh6Eig/SE09zTYmpJtY1Sjb5El8WhIVr5?=
 =?us-ascii?Q?xVpsFequDjkDnHQzvHve2K0YKgJLBplp4dWf7zM9Htr7w7wxLMpJIuo8gzmW?=
 =?us-ascii?Q?HLnR4tz70aIbxyD+EYucED7W7YGZJqpe8AFUo5pKB1Tf7kiaXkRYpMehenS8?=
 =?us-ascii?Q?Kk6q4A4Wi6h2Ac3wy/XesdE10iVo8jjujg225K39JmVaHqRF1AxTTx/zX/Gy?=
 =?us-ascii?Q?rtJqlA32ew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5df4de-d265-451c-07ed-08df10888742
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:28.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1U2jl4k/FoRnFUSVGJf4Kl1fCzXl5fjLiIKx1s7WzqmrzTo58lcWFChAFsDXR6SqUJxlK52ukcu0+p3AckzKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GSP posts unsolicited events on the GSP-to-CPU queue whenever it has
something to report, whether or not a caller is waiting for a reply.

Every existing way to read the queue asks for one message type and waits
on a deadline. A caller that only wants to empty the queue had nothing
to call.

Add a drain that logs and consumes whatever the GSP has already posted
and returns as soon as the queue is empty, without waiting. It holds the
queue mutex, so no reply is among the messages it reads, and it treats
every one of them as an event.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4595aa2176e5..acee444e898d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -632,6 +632,21 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     {
         self.inner.lock().await_msg()
     }
+
+    /// Logs and consumes every message the GSP has already posted, and returns without waiting for
+    /// more.
+    ///
+    /// No caller is waiting for a reply while this holds the queue mutex, so every message is
+    /// logged as an event. See "Draining the GSP-to-CPU queue" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    ///
+    /// # Errors
+    ///
+    /// `EIO` if the queue is poisoned, or if a message fails framing or checksum validation.
+    #[expect(dead_code)]
+    pub(crate) fn drain(&self) -> Result {
+        self.inner.lock().drain()
+    }
 }
 
 /// Inner mutex protected state of [`Cmdq`].
@@ -973,4 +988,30 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
             }
         }
     }
+
+    /// Logs and consumes every message the queue holds.
+    ///
+    /// # Errors
+    ///
+    /// `EIO` if the queue is poisoned, a message fails framing or checksum validation, or a
+    /// message's page count overflows a `u32`.
+    fn drain(&mut self) -> Result {
+        while !self.gsp_mem.driver_read_area().0.is_empty() {
+            // A message is available, so this returns without waiting.
+            let msg = self.wait_for_msg(Delta::ZERO)?;
+
+            let pages =
+                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
+                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
+                    EIO
+                })?;
+            let function = msg.header.function();
+            let seq = msg.header.sequence();
+
+            self.gsp_mem.advance_cpu_read_ptr(pages);
+            self.log_event(function, seq);
+        }
+
+        Ok(())
+    }
 }
-- 
2.55.0

