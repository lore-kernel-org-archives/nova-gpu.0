Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AC2368D67
	for <nova-gpu@lists.linux.dev>; Fri, 24 Jul 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878032; cv=fail; b=Dbuciysdi+ZQAkwDTHLS4mmMPS27vdMtE3POAqa6fbAho24BLcOhqGesLWufrTTp/CraXF0Mxb/1dtqncTIHSn7iZXwLxsOeY2J+Rn3be0D6h2kfPvmqamzi4a9l6swl+fZBtSOsEFJrr2xnT/jV1RDEIzSYpJs6WIHdEl6gJl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878032; c=relaxed/simple;
	bh=0kyVAIGn6EyWqJqq2hev4/ni66PzoYwypQ6FOTS5U8o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rB441fVNosMCSj+bUlR9CrSPjfbsc9qq0g52OjNeY75vUiDWKNY6NJ2RchHAJH1rFsyQsdvZq5/dbYjzFjs7pvoH2vUwRmDojWG26DVSQaFW9Unz0lFEdNa/868Spc0K9+8RC+ULJDuYWuE3J+ECL4qjSM14M1L9NToY/a9obhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XJx2vCJ+; arc=fail smtp.client-ip=40.107.209.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XJx2vCJ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrZ/IdMeGdSHvcbpFiZtZUysRYSJygtU64kmhrV6H+0WHMHwxij8HDUL27Hm3hpaoA6WHtLPoqQzZU59xMJBpMTHn49/0OjTh4kkUdBULo/5Fs6o3Ui6ASSIkuqlSUwqsEPpVOj6BK0NwgdzQF9DPBW5Y+7/Em7u1fpPZbt0AbyGafr+UHBa5Wr5SowzgtbCDHab5zudyogLcC1YIPzg6KOzJBB+t3dTZJ0y65kzXb5U+PYRIucQ+lparLqJFPviqGhDVuDwoU+6xveS3SYyvGilBukso46KCQ/ldOMBmrcUrzGYhEJY42npHeeU5JqfbpryMIj5Kezxq/R02lt66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb1JoZsvjvu8L9mvWfdKuCcSzvX0kJvF++P3l22c6zE=;
 b=p5dQfgG9J4aG5/v+vnze64+BNYbVYNw3nP7BkkbyGieJ4TiroxrzjPweIxBvdIkLqc75jfMtKw+SitGW25YB9VEbQi+/btnxQNnLm8QaXIkcNlxAPyy2aEP3n+WofcsvorvOoI+zBb57vApayVHrXJ3A5F5SoHgqJai31myhE5h2zu5HNibM4194lJIp+8NFa7awSRGjd8dTfqfnNxlcuRMaSpLJghB9h6wllDnswI40gDuGzDuio4r4MGqL3luKecDHTj6pPg5Lp3dRtIw71UhITWbKedgJ+ZwMORe3+jaCZVDOPRVUNsEoeKE0NsWmd3w5MKBHVcVqd/r8p8oCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb1JoZsvjvu8L9mvWfdKuCcSzvX0kJvF++P3l22c6zE=;
 b=XJx2vCJ+48CqZlSyD91CR+FDWmnc0f0jmIdGX8iTgGxZL9UoMkZdY330ebwvVRQmYNAiwh2843+LV5UaVkOP+maVaLwXiXN35qhC8mgZk72xhEEWjPTH9B+oGuXv8JE67GA1JTHdrHJ0KIu6awKI+T5usd15O8iWQ34uZjbhRoHVGTOfsZez0obMNe9WLEm/SforS75WPywblMc9DSGDVgzDbH4gN2q2DMG92H3LeoIcCsTMhLMnnJWWgU/9UocPUEbKfAiJsx6BMJ2gFtDpuVSIYEFcHlNYX66H/mdYpD2sn8AyhOMQibo2eSPjDEBksFjlu920sTJZ391tJYOdnQ==
Received: from BY3PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:39b::26)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:27:00 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::8) by BY3PR05CA0051.outlook.office365.com
 (2603:10b6:a03:39b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.6 via Frontend Transport; Fri, 24
 Jul 2026 07:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 07:27:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 24 Jul
 2026 00:26:46 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Jul
 2026 00:26:45 -0700
Received: from inno-dell (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Jul 2026 00:26:39 -0700
Date: Fri, 24 Jul 2026 10:26:33 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
	<apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhiwang@kernel.org>
Subject: Re: [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled
Message-ID: <20260724102633.0f814cd5@inno-dell>
In-Reply-To: <20260723200924.3388236-1-dakr@kernel.org>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
	<20260723200924.3388236-1-dakr@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf9fd2-815b-40e7-e61a-08dee954f369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700016|23010399003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gSlJ4MVi5Ak4VPxFbFgWgrg+jpSYWzvzGwysN1Wow0b79+nnt/dY5TsAgO8yhU5yr2R1Hpm6dzuxqLgl8u8i6dbgranB40dRXsjcr7X6T39luA1PwU+/JoAM+ueg7sFfA4JTMV86s1kaomBh0gNENrGxrwtZn28T0tRyrLLEfnrnuaugZvyV/ywHfivcX5P9M+W1lQ4qBbK+oOzxTX6QJ158NVXLSmPGwxa81w0pwMIvXXEq+k5cJV8RhVU2bbxS0QQLEPKTNQMm0h8eHsKK/y4djwNHL6x3Tzp2zBvvaieoMwo3sgHQ3+Xuci80EhUWWa6QxVXIm1cyF+1PfZNThg82uCCY9Kfx4V8cVQgdjR18mWXZG4jCIczw3L5amxB1bjzsnJVcLeK8aD5QFiDv4FokM+5RZXskpamMVxYFlucdkk44ySNJaSCEcMD1NVzm/5IuR3ePsZyEYcNiCMB2beHRW38ezlq6CrY/3vPd5J9XCZEXUyXre7jhnKMmH4SKYM7Uy9nP+rV32XwK55Gv2U8GUG9Xt+14LHuINX1P/wcb4ovqzYICSk890FLyziWP0RX3CjHCVIA2544v3DZTp2NGBI6HuOSOSbW5ri/RdXDTmEHO7pvwYtdneJo3DyqfHSTveYYf/6930MMi2hZOHehNo+jfj6FbYRt6yUVwQVYZ4g9KitYAnSe+wUycNHFcRRY+MmAd2vLsHe2ZhRgKlw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d6QXTsQl1gC/jjH1oL1PB6/czwZSE8JEbOlmVjf2hd6jeGLq9yAj0+LDcIFncwV4pRYwxZr3frhHYd+sMaeC5JOD9kImMzLySl3F6JqTzwm/kTsOp9xy5Ul987BDJ5CaapsIaVY64RUHZ5lH9NonILDiaacQo3ymvdadenIp3aPEHDjExNIC6zG4zM1NFcGskO/B8vDU4cwPqcBWH7nBIPZpyK1ymlKSUrQYYVO6jS/ys50Usj4g9H1eVewCQqSjxiTUjdgBOskjxaTRszVKHnQq7+EE5gEpFb+34YvIv+8nvsqdvONe1xCHOqECDkpyVE4NXqfXONDRBn1o7nUZONuJ8gJ1M9QbOOcGLQ15s5mWaLUMWSH88T8zsgmLfNyoCq3Qzs83d5493aU92bukIJXbjv5YyJyLxX/LtutV2nwiPJ/K0D4TqVpQbupG0hs5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:27:00.2273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf9fd2-815b-40e7-e61a-08dee954f369
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108

On Thu, 23 Jul 2026 22:09:24 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Wed, 22 Jul 2026 10:39:07 +0300, Zhi Wang wrote:
> > [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled
> 
> Applied, thanks!
> 

Hey Danilo and Alex, Thanks so much for the efforts!
