\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    r8 e' c a b4 h
    cis4. cis8 d d, d' c
    b8. c16 d2 c4
    h b a4. a8
    gis f'! e d c h c4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    r4 e2 d4
    e4. e8 f4 a~
    a8 g16 a b8 a gis4 a~
    a g~ g8 g f e
    d4 h'! a8 gis a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 a'^\tutti b h
    cis4. cis8 d[ d, d' c]
    b4 d2 c4
    h b a a8 a
    gis[ f'!] e[ d] c[ h] c4
  }
}

SopranoLyrics = \lyricmode {
  San -- _ ctus,
  san -- ctus, san --
  ctus, san -- ctus,
  san -- ctus Do -- mi -- nus
  De -- us Sa -- "ba -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e2.^\tutti d4
    r8 b'4 b8 a2~
    a8[ g16 a] b8[ a] gis4 a~
    a g2 f8[ e]
    d4 h'! a8[ gis] a a
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san --
  _ ctus Do --
  _ mi --
  nus De -- us Sa -- "ba -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4.^\tutti c8 cis4 d
    e8 e4 e8 d2
    d4 g,8[ a] h!8. h16 a4
    f' e2 d4~
    d8 c h4 e4. e8
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san -- _
  ctus, san -- ctus, san --
  ctus Do -- _ mi -- nus
  De -- us Sa --
  ba -- oth, Sa -- "ba -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'2.^\tutti gis4
    g2 f4 fis
    g4. f8 e4 f
    d e cis d8[ c]
    h[ a] gis4 a8[ e'] c[ a]
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- _ ctus
  Do -- mi -- nus De --
  _ us, De -- us,
  De -- us Sa -- "ba -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    a'2.-\tutti gis4
    g2 f4 fis
    g4. f8 e4 f
    d e cis d8 c
    h a gis4 << { a'8 e c a } \\ { a } >>
  }
}

BassFigures = \figuremode {
  r2 <2->4 <5 3>
  <4\+ _->2 <6>4 q8 <5>
  <9 _->4 <8>8 <7 _+>4 <5>
  <6 5> <5-> <6 5>2
  <6\\>8 <6!> <6> <5>4 <_+>4.
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
