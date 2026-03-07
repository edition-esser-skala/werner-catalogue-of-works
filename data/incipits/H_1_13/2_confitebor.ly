\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g''4. a8 g4. fis8
    g g4 fis8 g d e fis
    g4. a16 h a8 g4 fis8
    e4. e8 fis a,4 h8
    c! h c d h a h c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    d'4. d8 d4 d
    h8 e d4. h8 c h16 a
    h4. cis16 d e8 e d4~
    d8 cis16 h \hA cis4 d fis,8 g
    a g4 a8 d,2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4.^\tutti d8 d4 d
    h8 e d8. d16 d4 r
    r8 h h cis16[ d] e8 e d4~
    d8[ cis16 h] \hA cis4 d8 a4 h8
    c h c d h[ a] h c
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- mi -- ne,
  in to -- to cor -- de me --
  _ o, in con --
  si -- li -- o iu -- sto -- rum, et
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti a8 g4. fis8
    g g g fis g4 r
    r8 g g a16[ h] a8 g4 fis8
    e2 fis4 fis8 g
    a g g a d,4 d
  }
}

AltoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- mi -- ne,
  in to -- to cor -- _ de
  me -- o, in con --
  si -- li -- o iu -- sto -- rum,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h4.^\tutti d8 h4 a
    g8 c a8. a16 h4 r
    r8 e e h cis[ e] a,4
    a2 a4 r
    r8 e'4 d8 d8. c16 h8 a
  }
}

TenoreLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- mi -- ne,
  in to -- to cor -- de
  me -- o,
  in con -- si -- li -- o "iu -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti fis8 g4 d
    e8 c d8. d16 g,4 r
    r8 e' e d cis4 d
    a2 d4 r
    r8 e4 fis8 g fis g a
  }
}

BassoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- mi -- ne,
  in to -- to cor -- de
  me -- o,
  in con -- si -- li -- o "iu -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'4.-\tutti fis8 g4 d
    e8 c d4 g, r
    r8 e' e d cis4 d
    a2 d4 r
    r8 e4 fis8 g fis g a
  }
}

BassFigures = \figuremode {
  r2. <4>8 <_+>
  r4 <4>8 <_+> r2
  r8 <5>4 <6>8 q <5> <4> <_+>
  <4>4 <_+>2.
  r8 <5> <6> <6>4 r4.
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
