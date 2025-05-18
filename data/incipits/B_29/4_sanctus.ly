\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    r2 a'4. h8
    cis d e fis g g,4 a8
    h cis d cis16 h a4. h16 cis
    d8. e16 fis8 g a g16 fis e8 d
    cis8.\trill h16 a4 a4. a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    d4. e8 fis g a g16 fis
    e4 a, r2
    d8 e fis g a g fis e
    d d'4 cis16 h a4. h8
    e, e a fis e2\trill
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiosè"
    r2 a'4. h8
    cis[ d e fis] g g,4 a8
    h[ cis] d[ cis16 h] a4. h16[ cis]
    d8.[ e16] fis8[ g] a[ g16 fis] e8[ d]
    cis8.[\trill h16] a4 a2
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ ctus, san -- _
  _ _ _ _
  _ _ _ _
  _ ctus, "san -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiosè"
    d4. e8 fis[ g] a[ g16 fis]
    e4 a, r2
    d8[ e fis g] a[ g fis e]
    d d'4 cis16[ h] a4. h8
    e, e[ a] fis e2
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  _ ctus,
  san -- _
  ctus, san -- _ _ _
  ctus, san -- ctus, "san -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiosè"
    r2 r4 a~
    a8[ h cis d] e h4 cis8
    d[ cis16 h] a8[ g16 fis] e4 r
    r2 a4. h8
    cis8.[ d32 e] d4. cis16[ h] cis4
  }
}

TenoreLyrics = \lyricmode {
  San --
  _ _ _
  _ _ ctus,
  san -- _
  _ _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiosè"
    r4 d4. e8[ fis g]
    a4. g16[ fis] e4. d16[ cis]
    h[ h' a g] fis8[ e16 d] cis4 d8[ cis]
    h h'4 a16[ g] fis8[ e16 d] cis8[ h]
    a a'[ fis] d a2
  }
}

BassoLyrics = \lyricmode {
  San -- _
  _ _ _ _
  _ _ _ ctus,
  san -- _ _ _ _
  ctus, san -- ctus, "san -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagiosè"
    << { d'4 } \\ { r4 } >> d,4. e8 fis g
    a4. g16 fis e4. d16 cis
    << { h'8 a16 g } \\ { h,8 s } >> fis'8 e16 d cis4 d8 cis
    h h'4 a16 g fis8 e16 d cis8 h
    a a' fis d a2
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <6>8 q16 q q2
  r1
  r2 <4>4 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
