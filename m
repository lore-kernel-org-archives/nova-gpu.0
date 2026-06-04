Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E497200110
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 00:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533579; cv=fail; b=quW1bxcYsMXxnDGzb+VqoCkg9k4IZluqOxgIEJSnfnBd8ZSoeK1kMwtz56O+Ro8Mit6zRU6kpcvH6lkP6zTSUUaw1Q4pvAhLmYhe30vOk9jvlj+LSDEsE6Opm2654tyrDtxT85NncRl2eJT6BHHfqA495t1mO/AiBStdAyiMDws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533579; c=relaxed/simple;
	bh=BBGhap+QLHOKu3APuVWFA/KRxEh4xwe8VMx3sVxVMSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrB7hWBWhHzyE/8sa6m1y2SegspE01SD4VeuVLq1HIqzBiC/ZxjKtmR5m7Aj37Xh292wbFtaHh8tDam/z3vsitOGSdkwZJZ6J1xYKgM/0WssW2+GKw7LfQoLWW0HNx6WJUgzn61WyTXtTrDiXPKJ3A3K0tgqibkqMdjMym43wlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s+ZwbYdd; arc=fail smtp.client-ip=40.107.209.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s+ZwbYdd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VawKQKekR/ySW6ExEbtFpodoXYbeJmB3+4D4IEiclgXxjxOMfqqwkHRJZgFze36INVQIxv2z+wmdMGVWw46ISQ/MMMHoJSgkWCLe9THlMT2sPafFfh04Hiq1TJXbOAvRBHpn9gahgiQ0WkwLUEv2TwpGJrzIs5KwVwtr9/E0w6R0AYo7T9f7cGi4MLE17VLv+q+xnGFibtU4jEAy5W1clI16YUxGXsH4hpiqpWSHL8fLy5Cj1psq5E0FZX3dZMVWscyPDm/S5nJY2wLWfKGASfFBUAP2S7yQEA4dHHWlrOm63A7M+JpsgYR+gB5+BsWOf2IFVJjHmdtYR9kPp3TRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKrbsEttDBgCGw3J1uYaWN84bjUnr2v+Vd6SI53p0cI=;
 b=Y+aoqxj1kK2T4ZTty7uWbvzlDH3o3xr2Cdop84enwiaP0nx5+VIQV1eWhzxUO/I+5lIlb7szm+U+XdNlIi2b9c2C44CpIx/jkkhZDsTrLLxqAbGNBRCcB8su1Wr5r+FCyxe8KL+J3b/NPelNdwqGEpJaVQLMKDyWpBbKFEDDM31O4Y9wEeot/7qctUjVUkGYy3u4Ly/wAKMq/lT0jEEh4HFFYl/L78HaqTKo7dP+7UrPn3T8iJQhAaFivLcQ2u0IQr3B5Sx9NZ/b6axjDsia419hhLxcSVQ6zuof7Hal/PrTbDGKMnRoYzb0zHgz2kau6Bu46FplkQ9H6BU5V2nMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKrbsEttDBgCGw3J1uYaWN84bjUnr2v+Vd6SI53p0cI=;
 b=s+ZwbYddexyRdgZ+qF6B4c2admTsy1/ca6zmk7YAL213Yv+amqN0OvSPaqUXZhGt6ZPt4xSidZD1M5ucnHIuXncXo61MW1h7pb18ZjA7rlsjOAye+EM96PFq8qs3cGQfObyWUoUJZrpWGvvVgWxpklgo0JdxioIScnEJhLjPve8PHpT8NS54vb0oITtg+Y63y7EZgZLo5Wb1Z14AJ41TkLRa+AR0B4c1Z9CguKxuf1XHoDARNKaScoksg5OiJeYeuuqVd1YLPVM0QBdATbRn+ENXyaZEKif/YW/UCdMJLZvFxzASLvtWGXfsqkrM8PeAErAgx71KZNI7/XBB3uwGjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 00:39:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 00:39:34 +0000
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
Subject: [PATCH 1/1] gpu: add todo entry for device address type wrappers
Date: Wed,  3 Jun 2026 17:39:30 -0700
Message-ID: <20260604003930.145465-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604003930.145465-1-jhubbard@nvidia.com>
References: <20260604003930.145465-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c464c7-6d87-431b-a19d-08dec1d1bfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|6133799003|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eYgn2o7N0fnlX16TuBxop+ubmeHb3Kbvy2wokYr4Igs0mpGR3fGwJfnN8obBWaTcduAguNGtxsk/vV5jgTjksR5hJ1S3Nufy8iNaqoe8B/ev7C4yLZrc91qLMrExxYwNZtkBKE4lUL4wBykNCB8LSwVALkQziXnh+dpU0pRbsRguQCEvmz5ZuDIy6YdSh+Gn+5wdPZKvtmlKIMQWIq4Ssmv4b12TSzKTt5ZtwMKqArycZYuldtbSBcTaus3abrsdM1+SD/bh1LOI52EDHFQUAYt1QXffOzKgfZhOhF5hQPRFJRPRrf9k9Nb5P/qjwCIKeKu2rr/GqcHGC2OXwVxEG/d7z5Wl7l7PND3atDREGgujCjlYWT51gloFx+SKcC0PlKpsAhMWEZDtvWn5sTGKtS1FoDvr8Gow99BXqbpYT2rOvlB73EftU2W5jnyNDUjrfjIc5X4CvZ9Esg7DKi8Zmk/szGTd99Fu4cGX4d2vs7vpNxxkUiMffHIeEmKgtUfIO/s6JvppwLphZ9wS3oZWOHGuvQCdWp6oRjH3Le7KuZmIXhYsdtpnreGN7GDx2/Co5KYmFI7fXjO/CRpvpBBL7eqv1BnHrvOX9kxlYEKYt71vRNu/tKjjtBm6C9CxbnhJC08QEZ1ZQYASYJ9Hc0VxAv5y24O+ZrhSCt/4aFRtYA/0R3nWfFlW+6B1ImfTv16JtU6S8JXBhVVse4/YLmyC2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(6133799003)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lu7A7v/O+fnmeip8PBUtcdLq/LD1dHEe9TNMFaKFIPXXTkcp+Li7PZKL259R?=
 =?us-ascii?Q?3JOzjaaiTz/Zn9u/PP86drTF1E6RSq6MVf6pxpFd+L7e5aHI/HRIZ3yIMQL2?=
 =?us-ascii?Q?Kfxkygu11rC8mtKushRCjSKpahuG92ab1HiTVLpsyTZhfUy8DLokDLTXqWEB?=
 =?us-ascii?Q?JutRdxz/6PycPX55tBxr98sUHMA+CMpKldfap37d9Z2rAfcT0zodGTjUv90B?=
 =?us-ascii?Q?QbTpcU+iZr0QCywIEWdt+NtbuK7QTMgVlDm3XREuAM/MYA6D6IY9OFwk61cK?=
 =?us-ascii?Q?ycYOM7E6uEFSNLPB3iYJsPa20PeFDtawjOqdTteFBi3MrEAZQI9vsegiFzer?=
 =?us-ascii?Q?GPccBgPz9eUAprCVF0b8avdeXvU1ctXKMw+Lz8cYrfPvKceIyvX0ejmMCGsY?=
 =?us-ascii?Q?yaPIKAj9EEY/gOKIytc53o31b1vbl1daG0gMMy5fRwgSW1PhpLUC3DLSMhIY?=
 =?us-ascii?Q?pjGmJz3CQ1Bpec9xSxDV0945TdmxenOexcKWwT782+kvoeRXJesVB36A5NiD?=
 =?us-ascii?Q?gTxDC5Io/a+3rZmiKcE8aRd52nV9PFOlzEfzmXWB4wZ7TEOAsg3GbLRasABn?=
 =?us-ascii?Q?HGgemCormOs+q9fYEvdfGutq1NX2cuG8S3ZmWCkhn4ddLqABS+tR59eRyqLA?=
 =?us-ascii?Q?jxmg5ZZp4QQf0Or5+qX+sAmKX1MWE0SVrCCfglRLQlzamFVCRSloeV4rf2QN?=
 =?us-ascii?Q?CQcIg1ilXMvxewWsrpZp1mgDAbu9oGGLP9kdNg9QkzkawWDvCrbTd8QoYD2a?=
 =?us-ascii?Q?MiHzG+x1SW3MQkF8Ezot+EtFW2nAXkko7KvVf8a3NbWl9rfW0EA7ie+qHajO?=
 =?us-ascii?Q?abLU21c7vybFT/T//FnRAdb1EH1aXYdnnxg8fYcGzYO/Y/fGwD68qNaufNIp?=
 =?us-ascii?Q?HaZspb9IyjCkqZN1U5YpbljPXD0MSTxNKE0rZXSubqAtv+lhMF5KzbXzyDrf?=
 =?us-ascii?Q?as73c04TAOk/K584yDhv1T/L7K9iIIa3lgvg7+9dTlfVdcabG0obYvEK+mXY?=
 =?us-ascii?Q?UY2KQ/TWh4XWOgNrei/CHSQxHBVnIScpkBAxYtPCxuWsbdqmIh6NgWVSEpKk?=
 =?us-ascii?Q?jTsBnn/LNa+Yg3v1kPElpgkigtXssuVe1UVpLC02gVhOqem2/P3ExUdJJ3PV?=
 =?us-ascii?Q?hdhZySxaHWPWr01+QBK3Tt/M+TlChJZyNBrWj8wgS2xfFKQhobrPunQ0vKcG?=
 =?us-ascii?Q?9b1JO9YuSRsnI1KrWL7VZK8py1d/ZBws8qHqkANUdFBkzzHaf3wwWvzxYmro?=
 =?us-ascii?Q?puJu45U8y3SQMc4T6FcrEInNNQken0+YWUs3h76gg/tCw1jGeSDMsNqJ3de4?=
 =?us-ascii?Q?8beSvuWoZX6jSbMGakYsaEZ46qFxaPgSib2HEdUI+HPPmsk4J2xre+h6xJkf?=
 =?us-ascii?Q?CJHcOHa0AsWrmmS973fbliqhm6TRLK2DpixJaNq7OoilxF5iGeXmJErTWGd3?=
 =?us-ascii?Q?3dHeGel5hdkuOZkcNjL2Uld3Z0+rjK3wm2fi5f87XgPKr/oRFVzYa1TYUS/B?=
 =?us-ascii?Q?Bhn5dNO/Z9T17PVRyTyJ+FzEJ6YCkm58VFq99ygUS200zI+QbYczNYRnsDed?=
 =?us-ascii?Q?qDJh+sZEoHjqGyU4AI3/3kvkV/KMa62UeaQWICF6Wr9E4JCV56PkfXs8DTdA?=
 =?us-ascii?Q?zO8hZO5oSRb3FKnigQqK9tyiapa8aWADF/nCTIw+qAk/sKaSQlCQFsMt0o2t?=
 =?us-ascii?Q?3QhKeMPhPMDjknGmNuWIklJso1RKVL670N4Prq/E/BX6jVHPdB4ynpP7cw7a?=
 =?us-ascii?Q?rLpTUEnfAQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c464c7-6d87-431b-a19d-08dec1d1bfb6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 00:39:34.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xxZtgM3gOXispkA4r3NZ5lyl2futBPtY9q6kyCbZ8vZ8gqxJRLmMIYobJPJTSmOTgcriVMeryNbHw3tAG3phg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649

The SizeConstants trait provides SZ_* size constants for 32-bit,
64-bit, and pointer-sized integers. Device-centric DRM APIs such
as GPU VM management and buddy allocators could benefit from newtype
wrappers around those integer types for device addresses and sizes.
Add a todo entry to track designing those wrappers and a marker trait
for use as a generic bound.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index cdddf8db35f5..d7dbe8b298ce 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -686,6 +686,20 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Advanced
 
+Device address type wrappers
+-----------------------------
+
+The ``SizeConstants`` trait provides ``SZ_*`` constants as associated constants
+on ``u32``, ``u64``, and ``usize``. Device-centric APIs such as GPU VM
+management and buddy allocators could benefit from newtype wrappers around these
+integer types to represent device addresses and sizes. A separate marker trait
+could then serve as a generic bound for those wrappers. See the `original
+discussion <https://lore.kernel.org/all/DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org/>`_.
+
+Contact: Danilo Krummrich <dakr@kernel.org>
+
+Level: Intermediate
+
 Better Testing
 ==============
 
-- 
2.54.0

